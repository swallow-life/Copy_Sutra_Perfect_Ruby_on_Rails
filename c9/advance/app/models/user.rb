#9.17
class User < ActiveRecord::Base
	def address
		@address ||= Address.new(prefecture, city, house_number)
	end

	def address=(address)
		self.prefecture   = address.prefecture
		self.city         = address.city
		self.house_number = address.house_number
		@address = address
	end
end