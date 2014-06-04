class FlickrSearchPhotosWorker
  include Sidekiq::Worker

  def perform(query, page, page_size, key, result)
    result = result.symbolize_keys
    channel = result[:channel]

    result[:status] = :inprogress
    store[key] = result
    
    result = FlickrAdapter.search_photos(query, page, page_size)
    result = result.symbolize_keys
    result[:status] = :cached

    store[key] = result

    FayeService.publish(channel, result)
  end

  private

  def store
    Store.current
  end
end
