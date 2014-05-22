class ApplicationController < ActionController::Base
  protect_from_forgery

	def permit!
  each_pair do |key, value|
    convert_hashes_to_parameters(key, value)
    self[key].permit! if self[key].respond_to? :permit!
  end

  @permitted = true
  self
	end


end
