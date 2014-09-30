class AddAffiliationToRegistrations < ActiveRecord::Migration
  def change
    change_table :registrations do |t|
      t.string :affiliation
    end
  end
end
