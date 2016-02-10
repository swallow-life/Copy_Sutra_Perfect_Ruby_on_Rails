# Read about factories at https://github.com/thoughtbot/factory_girl

#7.11
FactoryGirl.define do
	factory :user, aliases: [:owner] do
		provider 'twitter'
		sequence(:uid) { |i| "uid#{i}" }
		sequence(:nickname) { |i| "nickname#{i}" }
		sequence(:image_url) { |i| "http://example.com/image#{i}.jpg" }
  end
end
