#7.4
#require 'spec_helper'
require 'rails_helper'

RSpec.describe Event, type: :model do
	#7.5
	describe '#name' do
		#7.8
		it { should validate_presence_of(:name) }
		it { should ensure_length_of(:name).is_at_most(50) }
	end

	#7.13
	describe '#created_by?' do
		let(:event) { create(:event) }
		subject { event.created_by?(user) }

		context '引数が nil なとき' do
			let(:user) { nil }
			it { should be_falsey }
		end

		context '#owner_id と引数の #id が同じとき' do
			let(:user) { double('user', id: event.owner_id) }
			it { should be_truthy }
		end
	end
	#7.24
	describe Event do
		describe '#rails?' do
			context '#name が "Rails勉強会" のとき' do
				it 'true を返すこと' do
					event = create(:event, name: 'Rails勉強会')
					expect(event.rails?).to eq true
				end
			end
			#7.26
			context '#name が "Ruby勉強会" のとき' do
				it 'false を返すこと' do
					event = create(:event, name: 'Ruby勉強会')
					expect(event.rails?).to eq false
				end
			end
		end
	end

end
#		#7.7
#		context 'nilのとき' do
#			let(:event) { Event.new(name: nil) }
#
#			it 'valid でないこと' do
#				event.valid?
#				expect(event.errors[:name]).to be_present
#			end
#		end
#
#		context '空白のとき' do
#			#7.6
#			let(:event) { Event.new(name: '') }
#
#			it 'valid でないこと' do
#				event.valid?
#				expect(event.errors[:name]).to be_present
#			end
#		end
#
#		#7.7
#		context '"Rails勉強会"のとき' do
#			let(:event) { Event.new(name: 'Rails勉強会') }
#
#			it 'valid であること' do
#				event.valid?
#				expect(event.errors[:name]).to be_blank
#			end
#		end
#
#		#7.7
#		context '50文字のとき' do
#			let(:event) { Event.new(name: 'a' * 50) }
#
#			it 'valid であること' do
#				event.valid?
#				expect(event.errors[:name]).to be_blank
#			end
#		end
#
#		#7.7
#		context '51文字のとき' do
#			let(:event) { Event.new(name: 'a' * 51) }
#
#			it 'valid でないこと' do
#				event.valid?
#				expect(event.errors[:name]).to be_present
#			end
#		end
#	end
#end
