class BookedRoom < ActiveRecord::Base
  belongs_to :room
  belongs_to :hotel
end
