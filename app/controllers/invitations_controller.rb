class InvitationsController < ApplicationController
  
  def index
    redirect_to :action => 'new'
  end
  
  def new
    @user = facebook_session.user
    update_profile if params[:from]
    @from_id = @user.to_s
  end
  
  def create
    @invited_ids = params[:ids]
    flash[:notice] = 'Azione eseguita con successo.'
    redirect_to new_match_path
  end
  
  private
  
  def update_profile
    @user.profile_fbml = render_to_string(:partial => 'profile', :locals => {:from => params[:from]})
  end
end
