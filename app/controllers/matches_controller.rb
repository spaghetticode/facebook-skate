class MatchesController < ApplicationController
  before_filter :clear_results
  
  def new
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
    @wins = current_user.won_matches
    @losts = current_user.lost_matches
  end

  private
  
  def clear_results
    session[:results] = nil
  end
end
