class Registration < ActiveRecord::Base

  validates_presence_of :email, :payment_type
  validates_presence_of :full_name, :first_name, :family_name, allow_nil: true
  validates_presence_of :invoice_needed
  validates_presence_of :invoice_title, if: -> (record) { record.invoice_needed == "invoice" }

  before_save :generate_full_name

  def generate_full_name
    self.full_name ||= "#{first_name} #{family_name}"
  end

end
