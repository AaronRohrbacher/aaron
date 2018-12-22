class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :check_ip_blacklist
  
  def check_ip_blacklist
    ENV['IP_BLACKLIST'].split(',').each { |ip| render plain: 'Forbidden, contact if in error', status: 403 if request.remote_ip.include? ip }
  end
end
