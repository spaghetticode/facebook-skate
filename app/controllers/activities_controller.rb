class ActivitiesController < ApplicationController
  
  def training
    unless current_user.training
      flash[:error] = "Per oggi ti sei allenato abbastanza, ora sfida un amico o fai qualcos'altro."
      redirect_to matches_path and return
    else
      @training_session = Message.first(:conditions => {:category => 'training'}, :order => 'random()')
      flash[:notice] = 'Ti sei allenato con impegno e hai guadagnato 10 punti esperienza.'
    end
  end
end
