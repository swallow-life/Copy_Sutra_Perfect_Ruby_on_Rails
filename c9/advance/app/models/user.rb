#9.17,9.19
class User < ActiveRecord::Base
	#9.19
	composed_of :address, mapping: [%w(prefecture prefecture), %w(city city), %w(house_number house_number)]

# 	def address
# 		@address ||= Address.new(prefecture, city, house_number)
# 	end

# 	def address=(address)
# 		self.prefecture   = address.prefecture
# 		self.city         = address.city
# 		self.house_number = address.house_number
# 		@address = address
# 	end
end