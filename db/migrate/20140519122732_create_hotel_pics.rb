class CreateHotelPics < ActiveRecord::Migration
  def change
    create_table :hotel_pics do |t|
      t.column :path, :string ,:limit => 50 , :null => false
      t.references :hotel
      t.timestamps
    end
    add_index :hotel_pics, :hotel_id
  end
end
