class User < ActiveRecord::Base
  #6.58
  before_destroy :check_all_events_finished

  #6.23,6.58
  has_many :created_events, class_name: 'Event', foreign_key: :owner_id, dependent: :nullify
  #6.40,6.58
  has_many :tickets, dependent: :nullify
  #6.58
  has_many :participating_events, through: :tickets, source: :event

  #6.9
  def self.find_or_create_from_auth_hash(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    nickname = auth_hash[:info][:nickname]
    image_url = auth_hash[:info][:image]

    User.find_or_create_by(provider: provider, uid: uid) do |user|
      user.nickname = nickname
      user.image_url = image_url
    end
  end

  #6.58
  private

  def check_all_events_finished
    now =Time.zone.now
    if created_events.where(':now < end_time', now: now).exists?
      errors[:base] << '公開中の未終了イベントが存在します。'
    end

    if participating_events.where(':now < end_time', now: now).exists?
      errors[:base] << '未終了の参加イベントが存在します。'
    end
    errors.blank?
  end
end
