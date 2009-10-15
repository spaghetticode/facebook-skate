class MatchesController < ApplicationController
  before_filter :clear_results
  
  def new
    if current_user.facebook_session.user.profile_fbml.blank?
      current_user.facebook_session.user.profile_fbml = 
      '<p>Ho aggiunto il gioco <a href="http://apps.facebook.com/playskate/">SKATE</a> alle mie applicazioni.</p>'
    end
  end

  def create
    unless params[:ids]
      flash[:error] = 'Devi scegliere un avversario'
      redirect_to new_match_path
    else
      @match = Match.create!(:user => current_user, :contender => User.for(params[:ids].first))
      flash[:notice] = 'La partita è iniziata! Tocca a te scegliere il primo trick.'
      redirect_to new_match_run_path(@match)
    end
  end

  def index
    if current_user.matches.empty?
      flash[:notice] = 'Non hai ancora sfidato nessuno, se vuoi puoi farlo adesso.'
      redirect_to new_match_path
    else
      @wins = current_user.won_matches
      @losses = current_user.lost_matches
    end
  end

  private
  
  def clear_results
    session[:results] = nil
  end
end
