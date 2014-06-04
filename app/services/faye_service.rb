class FayeService
  def self.publish(channel, data)
    return if configus.faye_url.nil?
    uri ||= URI.parse(configus.faye_url)
    message = { channel: channel, data: data }
    Net::HTTP.post_form(uri, message: message.to_json)
  end
end
