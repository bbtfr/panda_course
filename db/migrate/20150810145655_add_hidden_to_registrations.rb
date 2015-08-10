class AddHiddenToRegistrations < ActiveRecord::Migration
  def up
    add_column :registrations, :hidden, :boolean, default: false
    Registration.where("created_at < ?", Time.new(2015, 7, 1)).update_all(hidden: true)
  end

  def down
    remove_column :registrations, :hidden
  end
end
