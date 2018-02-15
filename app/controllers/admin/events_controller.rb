class Admin::EventsController < ApplicationController
  layout 'admin'
    
  def index
    @events = Event.all
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def new
    @event = Event.new
  end
  
  def create
    event_params = params.require(:event).permit(:title, :location, :start_at, :ticket_price, :ticket_quantity, :event_category_id)
    @event = Event.new(event_params)
    @event.save
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    event_params = params.require(:event).permit(:title, :location, :start_at, :ticket_price, :ticket_quantity, :event_category_id)
    @event.update(event_params)
    redirect_to admin_event_path(@event), notice: 'Event was successfully updated.'
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to admin_events_url, notice: 'Event was successfully destroyed.'
  end
end
