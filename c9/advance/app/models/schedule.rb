#9.8
class Schedule < ActiveRecord::Base
  belongs_to :room_id
	validates_with MustNotOverlapValidator
end
