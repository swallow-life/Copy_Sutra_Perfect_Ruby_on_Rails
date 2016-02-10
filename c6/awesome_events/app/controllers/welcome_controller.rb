class WelcomeController < ApplicationController
  #6.64
  PER = 10

  def index
		#6.68
		@q = Event.page(params[:page]).per(PER).order(:start_time).search(search_params)
    #6.31,6.64,6.68
		@events = @q.result(distinct: true)
  end
	#6.68
	private

	def search_params
		#6.70
		params.require(:q).permit(:name_cont, :start_time_gteq)
	rescue
		{ start_time_gteq: Time.zone.now }
	end
end
