class InvitationsController < ApplicationController
  
  def index
    redirect_to :action => 'new'
  end
  
  def new
    @user = facebook_session.user
    if params[:from]
      update_profile
    end
    @from_id = @user.to_s
  end
  
  def create
    @invited_ids = params[:ids]
  end
  
  private
  
  def update_profile
    @user.profile_fbml = render_to_string(:partial => 'profile', :locals => {:from => params[:from]})
  end
end
