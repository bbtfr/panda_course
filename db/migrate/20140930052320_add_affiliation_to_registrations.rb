class AddAffiliationToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :affiliation, :string
  end
end
