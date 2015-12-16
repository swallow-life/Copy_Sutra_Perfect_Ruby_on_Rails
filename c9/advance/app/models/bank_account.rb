#9.3
class BankAccount < ActiveRecord::Base
	before_save				EncryptionWrapper.new("credit_card_number")
	after_save				EncryptionWrapper.new("credit_card_number")
	after_initialize	EncryptionWrapper.new("credit_card_number")
end