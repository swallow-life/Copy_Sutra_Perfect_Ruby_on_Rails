#7.16
require 'rails_helper'

RSpec.describe "events/show", type: :view do
	#7.17
	context '未ログインユーザがアクセスしたとき' do
		before do
			# workaround: manually mocking to avoid exception.
			def view.logged_in?; end
			#allow(view).to receive(:logged_in?).and_return(false)
			def view.current_user; end
			#allow(view).to receive(:current_user).and_return(nil)
			def view.new_event_ticket_path(arg); ""; end
			#allow(view).to receive(:new_event_ticket_path).with(an_instance_of(Event)).and_return("")
		end

		context 'かつ @event.owner が nil のとき' do
			before do
				assign(:event, create(:event, owner: nil))
				assign(:tickets, [])
			end

			it '"退会したユーザです"と表示されていること' do
				render
				expect(rendered).to match /退会したユーザです/
			end
		end
	end
end
