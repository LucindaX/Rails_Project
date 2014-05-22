class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.column :room_type , :string ,:limit => 50 , :null => false
      t.column :avatar ,:string ,:limit => 50 , :null => false
      t.column :quantity ,:decimal ,:null => false
      t.column :descs ,:text ,:null => false
      t.column :price ,:decimal ,:null => false
      t.references :hotel
      t.timestamps
    end
	add_index :rooms, :hotel_id
  end
end
