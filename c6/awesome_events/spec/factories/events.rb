# Read about factories at https://github.com/thoughtbot/factory_girl

#7.9
FactoryGirl.define do
	#7.10
  factory :event do
		owner
		sequence(:name) { |i| "イベント名#{i}" }
		sequence(:place) { |i| "イベント開催場所#{i}" }
		sequence(:content) { |i| "イベント本文#{i}" }
		start_time { rand(1..30).days.from_now }
		end_time { start_time + rand(1..30).hours }
  end
end
