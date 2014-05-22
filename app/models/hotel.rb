class Hotel < ActiveRecord::Base
	has_many :rooms
	mount_uploader :avatar, AvatarUploader
	has_many :hotel_pics
	has_many :comments

end
