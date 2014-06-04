@getFlickrPhotos = (query)->
  dfd = $.Deferred()

  console.log("Делаем запрос")
  $.get('/api/v1/photos/search.json', { query: query })
    .then (data)->
      if data.status == "cached"
        console.log("Результат оказался закэшированным", data)
        dfd.resolve(data)
      else
        console.log("Результат нужно подождать", data)
        subscription = faye_client().subscribe(data.channel, (d) ->
          console.log("Пришло по подписке", d)
          dfd.resolve(d)
          subscription.cancel()
        )

  return dfd.promise()
