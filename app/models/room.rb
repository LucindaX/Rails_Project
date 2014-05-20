class Room < ActiveRecord::Base
  belongs_to :hotel
  mount_uploader :avatar, AvatarUploader
  has_many :booked_rooms
end
