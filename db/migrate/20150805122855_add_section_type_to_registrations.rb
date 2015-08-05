class AddSectionTypeToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :section_type, :string
  end
end
