class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.column :name ,:string ,:limit => 25 , :null => false
      t.column :avatar ,:string ,:limit => 50 ,:null => false
      t.column :city ,:string ,:limit => 25, :null => false
      t.column :country ,:string ,:limit => 25, :null => false
      t.column :desc ,:text ,:null => false 
      t.column :rating ,:decimal ,:null => false 
      t.timestamps
    end
  end
end
