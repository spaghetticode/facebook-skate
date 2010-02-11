class RunsController < ApplicationController
  before_filter :find_match, :find_contender, :update_session
  
  def index
  end
  
  def new
    tricks = @contender.available_tricks
    @trick = tricks[rand(tricks.size)]
  end
  
  def create
    @trick = Trick.find(params[:run][:trick_id])
    update_results
    if won?
      flash[:notice] = 'Hai vinto la sfida, guadagnando denaro e esperienza.'
      current_user.update_rank
      update_winner(current_user)
      @match.close && @match.won
    elsif lost?
      flash[:error] = 'Hai perso la sfida. Niente denaro, ma hai guadagnato esperienza.'
      current_user.update_rank
      update_winner(@contender)
      @match.close
    else
      redirect_to new_match_run_path(@match) and return
    end
    redirect_to new_match_path
  end
  
  private
  
  def update_winner(user)
    user.update_experience(session[:results])
  end
  
  def find_match
    @match = Match.find(params[:match_id])
    if @match.closed?
      flash[:error] = 'Questa partita è già terminata.'
      redirect_to new_match_path
    end
  end
  
  def find_contender
    @contender = @match.contender
  end
  
  def update_results
    if current_user.cant_do(@trick)
      shall_loose
    elsif current_user.more_experienced?(@contender)
      should_win
    elsif current_user.less_experienced?(@contender)
      should_loose
    else
      could_win
    end
  end

  def won?
    session[:results][:wins] > 5
  end
  
  def lost?
    session[:results][:losses] > 5
  end
  
  def shall_loose
    logger.info "shall loose"
    rand(10) == 1 ? increase_wins : increase_losses
  end
  
  def should_loose
    logger.info "should loose"
    rand(4) == 1 ? increase_wins : increase_losses
  end
  
  def should_win
    logger.info "should win"
    rand(4) == 1 ? increase_losses : increase_wins
  end
  
  def could_win
    logger.info "could win"
    rand(2) == 1 ? increase_losses : increase_wins
  end
  
  def increase_wins
    session[:results][:wins] += 1
    session[:results][:money] += 1
    session[:results][:missed] = false
    session[:results][:experience] +=1
    flash[:notice] = "Il tuo avversario ha sbagliato. Tocca a te scegliere il prossimo trick."
  end
  
  def increase_losses
    session[:results][:losses] += 1
    session[:results][:missed] = true
    session[:results][:experience] +=1
    flash[:error] = 'Hai sbagliato. Tocca al tuo avversario scegliere il prossimo trick.'
  end
  
  def update_session
    session[:results] ||= {:wins => 0, :losses => 0, :missed => false, :money => 0, :experience => 0}
  end
end
