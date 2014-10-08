class AddInvoiceNeededToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :invoice_needed, :string
  end
end
