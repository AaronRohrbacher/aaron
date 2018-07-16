class IpService
  def detect_city(ip_address)
    result = RestClient.get("http://api.ipstack.com/#{ip_address}?access_key=#{ENV['IP_STACK_KEY']}")
    JSON.parse(result)['city']
  end
end
