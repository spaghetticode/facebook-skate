class SponsorsController < ApplicationController
  ensure_authenticated_to_facebook :only => []
  before_filter :admin_authorize
  skip_before_filter :set_current_user
  layout 'admin'

  def index
    @sponsors = Sponsor.ordered
  end

  def new
    @sponsor = Sponsor.new
  end

  def edit
    @sponsor = Sponsor.find(params[:id])
  end

  def create
    @sponsor = Sponsor.new(params[:sponsor])
    if @sponsor.save
      flash[:notice] = 'Sponsor was successfully created.'
      redirect_to sponsors_path
    else
      render :action => "new"
    end
  end

  def update
    @sponsor = Sponsor.find(params[:id])
    if @sponsor.update_attributes(params[:sponsor])
      flash[:notice] = 'Sponsor was successfully updated.'
      redirect_to sponsors_path
    else
      render :action => "edit"
    end
  end

  def destroy
    @sponsor = Sponsor.find(params[:id])
    @sponsor.destroy
    redirect_to sponsors_path
  end
end
