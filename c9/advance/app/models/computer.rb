#9.11
class Computer
	include ActiveModel::Dirty

	define_attribute_methods :name

	def name
		@name
	end

	def name=(val)
		name_will_change! unless val == @name
		@name = val
	end

	def save
		@previously_changed = changes
		@changed_attributes.clear
	end
end
