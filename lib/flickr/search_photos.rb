module Flickr
  class SearchPhotos
    class << self
      def search_async(query, page, page_size=100)
      end

      def search(query)
        get_photos_from_flickr(query)
      end

      private

      def get_photos_from_flickr(query={})
        {
          photos: [
            { url: "/1.gif" },
            { url: "/2.gif" },
            { url: "/3.gif" }
          ]
        }
      end

      def cache(key)
        yield
      end

      def store
      end
    end
  end
end
