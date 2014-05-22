class AddVotesToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :votes, :integer, :default => 0
  end
end
