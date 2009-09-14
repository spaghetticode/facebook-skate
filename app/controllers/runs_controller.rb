class RunsController < ApplicationController
  before_filter :find_match, :find_contender
  
  def index
  end
  
  def new
    tricks = @contender.available_tricks
    @trick = tricks[rand(tricks.size)]
  end
  
  def create
    session[:results] ||= {:wins => 0, :losses => 0, :missed => false, :money => 0, :experience => 0}
    @trick = Trick.find(params[:run][:trick_id])
    update_results
    if won?
      flash[:notice] = 'Hai vinto la sfida, guadagnando denaro e esperienza.'
      @match.update_attributes(:victory => true, :closed => true)
      current_user.try_to_update
      current_user.update_attributes(
        :money =>  current_user.money+session[:results][:money],
        :experience => current_user.experience+session[:results][:experience]
      )
      @contender.update_attribute(:experience, @contender.experience+session[:results][:experience])
      @match.update_attribute(:closed, true)
    elsif lost?
      flash[:error] = 'Hai perso la sfida. Niente denaro, ma hai guadagnato esperienza.'
      current_user.try_to_update
      @contender.update_attributes(
        :money =>  current_user.money+session[:results][:money],
        :experience => current_user.experience+session[:results][:experience]
      )
      current_user.update_attribute(:experience, @contender.experience+session[:results][:experience])
      @match.update_attribute(:closed, true)
    else
      redirect_to new_match_run_path(@match) and return
    end
    redirect_to new_match_path
  end
  
  private
  
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
    if cant_do_trick?
      shall_loose
    elsif more_experienced?
      should_win
    elsif less_experienced?
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
  
  def cant_do_trick?
    !current_user.available_tricks.include?(@trick)
  end
  
  def more_experienced?
    current_user.experience > @contender.experience
  end
  
  def less_experienced?
    @contender.experience < current_user.experience
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
end
