module FlickrAdapter
  class << self
    def search_photos(query, page=1, page_size=10)
      {
        page: 1,
        page_count: 1,
        page_size: 10,
        photos: [
          { id: 1, url: "http://example.com/1.jpg" },
          { id: 2, url: "http://example.com/2.jpg" },
          { id: 3, url: "http://example.com/3.jpg" },
          { id: 4, url: "http://example.com/4.jpg" },
          { id: 5, url: "http://example.com/5.jpg" },
          { id: 6, url: "http://example.com/6.jpg" },
          { id: 7, url: "http://example.com/7.jpg" },
          { id: 8, url: "http://example.com/8.jpg" },
          { id: 9, url: "http://example.com/9.jpg" },
          { id: 10, url: "http://example.com/10.jpg" }
        ]
      }
    end
  end
end
