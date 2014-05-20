class CreateBookedRooms < ActiveRecord::Migration
  def change
    create_table :booked_rooms do |t|
      t.column :from_date ,:date ,:null => false
      t.column :to_date ,:date ,:null => false
      t.column :quantity ,:integer ,:null => false
      t.column :descs ,:string ,:null => false
      t.references :room
      t.references :hotel
      t.timestamps
    end
	 add_index :booked_rooms, :hotel_id
	 add_index :booked_rooms, :room_id
  end
end
