class AdminUser < ActiveRecord::Base

	has_many :articles
	has_many :comments
	has_secure_password

end
