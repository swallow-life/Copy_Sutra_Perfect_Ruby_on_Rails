class EventsController < ApplicationController
  #6.22,6.27
  before_action :authenticate, except: :show

  #6.27
  def show
    @event = Event.find(params[:id])
    #6.51
    @ticket = current_user && current_user.tickets.find_by(event_id: params[:id])
    #6.49
    @tickets = @event.tickets.includes(:user).order(:created_at)
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to @event, notice: '作成しました'
    else
      render :new
    end
  end

  #6.34
  def edit
    @event = current_user.created_events.find(params[:id])
  end

  def update
    @event = current_user.created_events.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: '更新しました'
    else
      render :edit
    end
  end

  #6.37
  def destroy
    @event = current_user.created_events.find(params[:id])
    @event.destroy!
    redirect_to root_path, notice: '削除しました'
  end

  private

  def event_params
    params.require(:event).permit(
			#6.74
			:name, :place, :event_image, :event_image_cache,
			:remove_event_image, :content, :start_time, :end_time
    )
  end
end
