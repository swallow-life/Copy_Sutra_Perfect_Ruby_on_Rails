class Event < ActiveRecord::Base
	#6.71
	mount_uploader :event_image, EventImageUploader
  #6.41,6.53
  has_many :tickets, dependent: :destroy
  #6.29
  belongs_to :owner, class_name: 'User'
  #6.41
  has_many :tickets

  #6.18
  validates :name, length: { maximum: 50 }, presence: true
  validates :place, length: { maximum: 100 }, presence: true
  validates :content, length: { maximum: 2000 }, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :start_time_should_be_before_end_time

  #6.33
  def created_by?(user)
    return false unless user
    owner_id == user.id
  end

	#7.25
	def rails?
		#7.27,7.28
		!!(name =~ /Rails/)
	end

  private

	#6.69
	def self.ransackable_attrubutes(auth_object = nil)
		%w(name start_time)
	end

	def self.ransackable_associations(auth_object = nil)
		[]
	end

  def start_time_should_be_before_end_time
    return unless start_time && end_time

    if start_time >= end_time
      errors.add(:start_time, 'は終了時間よりも前に設定してください')
    end
  end
end
