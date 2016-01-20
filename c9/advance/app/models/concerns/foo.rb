#9.24
module Foo
	extend ActiveSupport::Concern

	module ClassMethods
		def appended_class_method
			puts "追加されたクラスメソッド"
		end
	end

	def appended_instance_method
		puts "追加されたインスタンスメソッド"
	end
end