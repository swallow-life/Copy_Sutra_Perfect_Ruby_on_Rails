#9.13
class BlogPost# < Struct.new(:subject, :body, :created_at)
	include ActiveModel::Serializers::JSON

	attr_accessor :subject, :body, :created_at

	def attributes=(hash)
		hash.each do |key, value|
			instance_variable_set("@#{key}", value)
		end
	end

	def attributes
		{'subject' => @subject, 'body' => @body, 'created_at' => @created_at}
	end
end
