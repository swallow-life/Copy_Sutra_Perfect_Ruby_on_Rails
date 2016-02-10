class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  #6.39
  validates :comment, length: { maximum: 30 }, allow_blank: true
end
