#9.15
class BlogComment
	include ActiveModel::Model

	attr_accessor :body, :commenter, :created_at

	validates_presence_of :body, :commenter
end