class Post < ActiveRecord::Base
	belongs_to :groups
	validates :content, :presence => true
end
