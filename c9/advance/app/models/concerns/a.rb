#9.27
module A
	extend ActiveSupport::Concern

	module ClassMethods
		def class_method_injected_by_a
			puts "A Class Method"
		end
	end

	def instance_method_injected_by_a
		puts "A Instance Method"
	end
end