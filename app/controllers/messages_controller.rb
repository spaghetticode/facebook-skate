class MessagesController < ApplicationController
  ensure_authenticated_to_facebook :only => []
  before_filter :admin_authorize
  skip_before_filter :set_current_user
  layout 'admin'
  
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def edit
    @message = Message.find(params[:id])
  end

  def create
    @message = Message.new(params[:message])
    if @message.save
      flash[:notice] = 'Message was successfully created.'
      redirect_to messages_path
    else
      render :action => "new"
    end
  end

  def update
    @message = Message.find(params[:id])
    if @message.update_attributes(params[:message])
      flash[:notice] = 'Message was successfully updated.'
      redirect_to messages_path
    else
      render :action => "edit"
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to messages_path
  end
end
