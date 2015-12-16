#9.3
class EncryptionWrapper
	def initialize(attribute)
		@attribute = attribute
	end

	def before_save(record)
		record.send("#{@attribute}=", encrypt(record.send("#{@attribute}")))
	end

	def after_save(record)
		record.send("#{@attribute}=", decrypt(record.send("#{@attribute}")))
	end

	alias_method :after_initialize, :after_save

	private
	def encrypt(value)
		# Secrecy is commited
	end

	def decrypt(value)
		# Secrecy is commited
	end
end
