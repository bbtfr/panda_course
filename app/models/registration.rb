class Registration < ActiveRecord::Base

  validates_presence_of :email, :payment_type
  validates_presence_of :full_name, :first_name, :family_name, allow_nil: true
  validates_presence_of :profession
  validates_presence_of :invoice_needed
  validates_presence_of :invoice_title, if: -> (record) { record.invoice_needed == "invoice" }
  validates_presence_of :section_type, if: -> (record) { record.profession == "employee" }

  validates_uniqueness_of :email

  before_save :generate_full_name

  def generate_full_name
    self.full_name ||= "#{first_name} #{family_name}"
  end

end
