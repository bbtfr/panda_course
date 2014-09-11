class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :first_name
      t.string :family_name
      t.string :full_name
      t.string :profession
      t.string :title
      t.string :address
      t.string :postcode
      t.string :email
      t.string :phone
      t.string :payment_type
      t.string :invoice_title

      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
