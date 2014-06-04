module FlickrAdapter
  class << self
    def search_photos_async(query, page=1, page_size=10)
      key = generate_key(query, page, page_size)
      if store.key?(key)
        store[key]
      else
        result = {}
        result[:key] = key
        result[:channel] = "/photos/#{ SecureRandom.uuid }"
        result[:status] = "new"
        
        FlickrSearchPhotosWorker.perform_async(query, page, page_size, key, result)

        result
      end
    end

    def search_photos(query, page=1, page_size=10)
      r = flickr.photos.search(text: query, page: page, per_page: page_size)
      result = {
        page: r.page,
        page_count: r.total,
        page_size: r.perpage,
        photos: []
      }
      r.each do |photo|
        url = "http://farm#{photo.farm}.staticflickr.com/#{photo.server}/#{photo.id}_#{photo.secret}.jpg"
        item = {
          id: photo.id,
          url: url
        }
        result[:photos] << item
      end

      result
    end

    def flickr
      @flickr ||= FlickRaw::Flickr.new
    end

    def store
      Store.current
    end

    def generate_key(query, page, page_size)
      key = [query, page, page_size]
      key = Marshal.dump(key)
      key = Base64.encode64(key)
      
      key
    end
  end
end
