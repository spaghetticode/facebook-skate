class EventsController < ApplicationController
  ensure_authenticated_to_facebook  :only => :choose
  before_filter :admin_authorize, :except => :choose
  skip_before_filter :set_current_user, :except => :choose
  layout 'admin'
  
  def index
    @events = Event.all
  end
  
  def choose
    # randomizzo l'evento trovato:
    @event = Event.find(rand(Event.count)+1)
    eval @event.executable
    flash.now[:notice] = @event.message
    render :layout => 'application'
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to events_path
    else
      render :action => "new"
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      flash[:notice] = 'Event was successfully updated.'
      redirect_to events_path
    else
      render :action => "edit"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end
end
