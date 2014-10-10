class AddRequestToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :request, :text
  end
end
