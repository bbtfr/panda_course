class RegistrationsController < ApplicationController

  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(registration_params)
    if @registration.save
      flash[:info] = t(:success, scope: "registration/new")
      redirect_to page_path(id: :registration)
    else
      render "new"
    end
  end

  protected

    def registration_params
      params.require(:registration).permit(%i(first_name family_name \
        full_name profession title address postcode phone email \
        payment_type invoice_title invoice_needed affiliation request))
    end

end
