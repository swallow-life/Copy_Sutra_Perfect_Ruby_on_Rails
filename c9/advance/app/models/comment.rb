#9.29
class Comment < ActiveRecord::Base
	concerning :PublishedScope do
		included do
			scope :published, -> { where.not(published_at: nil) }
		end
	end
end