class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
    t.column :head ,:string , :limit => 50 ,:null => false
      t.column :body ,:text ,:null => false
      t.column :rating ,:decimal ,:null => false
      t.references :hotel

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :hotel_id
  end
end
