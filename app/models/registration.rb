class Registration < ActiveRecord::Base

  validates_presence_of :email, :payment_type
  validates_presence_of :full_name, :first_name, :family_name, allow_nil: true

  before_save :generate_full_name

  def generate_full_name
    self.full_name ||= "#{first_name} #{family_name}"
  end

end
