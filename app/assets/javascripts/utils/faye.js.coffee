client = null
@faye_client = ->
  client ?= new Faye.Client(gon.faye_url)

