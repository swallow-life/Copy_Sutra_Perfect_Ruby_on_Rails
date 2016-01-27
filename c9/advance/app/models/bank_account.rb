#9.3,9.32,9.34
class BankAccount < ActiveRecord::Base
# 	before_save				EncryptionWrapper.new("credit_card_number")
# 	after_save				EncryptionWrapper.new("credit_card_number")
# 	after_initialize	EncryptionWrapper.new("credit_card_number")

	composed_of :balance, class_name: "Money", mapping: [%w(amount amount), %w(currency currency)]
end