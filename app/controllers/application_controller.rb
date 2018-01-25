class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # def ip_detector(ip_address)
  #   result = RestClient.get("http://api.hostip.info/get_json.php?ip=#{ip_address}")
  #   JSON.parse(result)['city']
  # end
end
