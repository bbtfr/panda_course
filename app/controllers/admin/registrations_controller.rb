class Admin::RegistrationsController < Admin::ApplicationController

  def index
    @registrations = Registration.all
  end

end
