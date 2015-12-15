#9.1
class CreditCard < ActiveRecord::Base
	# String everything but digits, so the user can specify "555 234 34" or
	# "5552-3434" and both will mean "55523434"
	before_validation(on: :create) do
		self.number = number.gsub(/[^0-9]/, "") if attribute_present?("number")
	end
end