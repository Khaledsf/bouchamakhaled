class Article < ActiveRecord::Base

	belongs_to :admin_user
	has_many :comments

end
