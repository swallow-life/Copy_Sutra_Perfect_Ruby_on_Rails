#9.6
class EmailValidator < ActiveModel::EachValidator
	def validate_each(record, attribute, value)
		record.errors.add attribute, (options[:message] || "is not an email") unless
			value =~ /\A([^@\s]+\.)+[a-z]{2,}\z/
	end
end
