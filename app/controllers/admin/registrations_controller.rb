class Admin::RegistrationsController < Admin::ApplicationController
  require 'csv'

  def index
    @registrations = Registration.all

    @attributes = %i(id full_name affiliation profession title address postcode phone email payment_type invoice_title created_at)
    @listed_attributes = %i(full_name profession title phone email payment_type)
    @detailed_attributes = @attributes
    @translate_attributes = %i(profession title payment_type)
    @data = Hash[ @registrations.map do |registration|
      [ registration.id, Hash[ @attributes.map do |attribute|
        attr_value = registration.send(attribute)
        [ attribute, @translate_attributes.include?(attribute) ? attr_value.blank? ? nil : t(attr_value, scope: "activerecord.attributes.registration/#{attribute}", default: attr_value) : attr_value ]
      end ] ]
    end ]

    respond_to do |format|
      format.html
      format.csv do
        send_data(render_to_string)
      end
      format.xls do
        send_data(render_to_string)
      end
    end
  end

end
