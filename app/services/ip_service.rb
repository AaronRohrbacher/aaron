class IpService
  def detect_city(ip_address)
    result = RestClient.get("https://api.ipstack.com/#{ip_address}?access_key=#{ENV['IP_STACK_KEY']}")
    JSON.parse(result)['city']
  end

  # def detect_city(ip_address)
  #   result = RestClient.get("http://api.hostip.info/get_json.php?ip=#{ip_address}")
  #   JSON.parse(result)['city']
  # end
end
