@getFlickrPhotos = (query)->
  dfd = $.Deferred()

  $.get('/api/v1/photos/search.json', { query: query })
    .then (data)->
      if data.status == "cached"
        dfd.resolve(data)
      else
        subscription = faye_client().subscribe(data.channel, (d) ->
          dfd.resolve(d)
          subscription.cancel()
        )

  return dfd.promise()
