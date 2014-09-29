class Admin::ApplicationController < ApplicationController
  USERNAME, PASSWORD = Setting.admin_username, Setting.admin_password  
  
  before_action :authenticate
  layout "admin"

  private  
  
    def authenticate  
      authenticate_or_request_with_http_basic do |username, password| 
        username == USERNAME && password == PASSWORD  
      end  
    end

    def set_locale
      I18n.locale = :"zh-CN"
    end

end
