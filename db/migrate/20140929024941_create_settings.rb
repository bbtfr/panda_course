class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.string :var, :null => false
      t.text   :value, :null => true
      t.integer :thing_id, :null => true
      t.string :thing_type, :limit => 30, :null => true
      t.timestamps
    end
    
    add_index :settings, [ :thing_type, :thing_id, :var ], :unique => true

    Setting.secret_key_base = 'a3738a6a2d4b0349976a19a3ab9307ec7b8d164fcd67b63b76faaada218d355d913a85f1da465f81fc08568771282f510c8fb55c7781ab290a1904ac19afb312'
  end

  def self.down
    drop_table :settings
  end
end
