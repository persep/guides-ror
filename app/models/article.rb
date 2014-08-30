class Article < ActiveRecord::Base
	has_many :comments # One article can have many comments
	
	validates :title, presence: true, length: { minimum: 5 }
end
