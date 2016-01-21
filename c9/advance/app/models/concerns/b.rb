#9.27
module B
	extend ActiveSupport::Concern
	include A

	module ClassMethods
		def class_method_injected_by_b
			puts "B Class Method"
			class_method_injected_by_a
		end
	end
end
