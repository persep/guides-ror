class Article < ActiveRecord::Base
	has_many :comments, # One article can have many comments
		dependent: :destroy # when you delete an article you delete all the comments
	
	validates :title, presence: true, length: { minimum: 5 }
end
