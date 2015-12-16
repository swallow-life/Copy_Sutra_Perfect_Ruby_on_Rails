#9.5
class User
	validates :login presence: true, exclusion: {in: %w(admin)}
	validates :email, presence: true, uniqueness: true
	validates :age, numericality: {greater_than_or_equal_to: 20}, uniqueness: true

	validates_confirmation_of :password
	# validates :password, cofirmation: true と等しい

	validate :must_have_twitter_uid_or_facebook_uid

	# もしくは
	# validate do
	# 	errors.add(:base, 'must have twitter_uid or facebook_uid')
	# end

	private

	def must_have_twitter_uid_or_facebook_uid
		if twitter_uid.blank? && facebook_uid.blank?
			errors.add(:base, 'must have twitter_uid or facebook_uid')
		end
	end
end

