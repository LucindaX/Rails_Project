class HotelPic < ActiveRecord::Base
  has_one :hotel
  mount_uploader :avatar, AvatarUploader
end
