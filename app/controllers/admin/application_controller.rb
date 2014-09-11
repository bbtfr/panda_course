class Admin::ApplicationController < ApplicationController
  USER_NAME, PASSWORD = "admin", "secret"  
  
  before_action :authenticate
  layout "admin"

  private  
  
    def authenticate  
      authenticate_or_request_with_http_basic do |user_name, password| 
        user_name == USER_NAME && password == PASSWORD  
      end  
    end

    def set_locale
      I18n.locale = :"zh-CN"
    end

end
