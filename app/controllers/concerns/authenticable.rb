module Authenticable  
  extend ActiveSupport::Concern
  
  included do
    before_action :authenticate!
  end

  def authenticate!
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['username'] && password == ENV['password']
    end
  end
end