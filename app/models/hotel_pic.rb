class HotelPic < ActiveRecord::Base
  belongs_to :hotel
  mount_uploader :path, AvatarUploader
end
