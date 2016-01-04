#9.6,9.9
class Person
# 	include ActiveModel::Validations
	#9.9
	include ActiveModel::AttributeMethods

	attribute_method_affix({prefix: 'reset_', suffix: '_to_default!'}, {prefix: 'reset_', suffix: '_to_def'})
# 	attribute_method_affix prefix: 'reset_', suffix: '_to_def'
	attribute_method_suffix '_contrived?'
	attribute_method_prefix 'clear_'
	define_attribute_methods :name
# 	attr_accessor :name, :email
	attr_accessor :name
# 	validate :email, presence: true, email: true

	def attributes
		{'name' => @name}
	end

	private

	def attribute_contrived?(attr)
		true
	end

	def clear_attribute(attr)
		send("#{attr}=", nil)
	end

	def reset_attribute_to_default!(attr)
		send("#{attr}=", 'Default Name')
	end

	def reset_attribute_to_def(attr)
		send("#{attr}=", 'Def')
	end
end
