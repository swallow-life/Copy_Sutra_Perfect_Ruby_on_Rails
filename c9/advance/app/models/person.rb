#9.6
class Person
	include ActiveModel::Validions
	attr_accessor :name, :email

	validate :email, presence: true, email: true
end
