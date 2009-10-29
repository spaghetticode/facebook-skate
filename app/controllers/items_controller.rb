class ItemsController < ApplicationController
  ensure_authenticated_to_facebook :only => [:shopping, :buy, :sell]
  before_filter :admin_authorize, :except => [:shopping, :buy, :sell]
  skip_before_filter :set_current_user, :except => [:shopping, :buy, :sell]
  layout 'admin'
  
  def shopping
    @items = Item.all(:order => 'rank_id', :conditions => ['rank_id <= ?', current_user.rank_id])
    render :layout => 'application'
  end
  
  def buy
    @item = Item.find(params[:id])
    if current_user.buy(@item)
      flash[:notice] = "Hai speso &euro; #{@item.price} e hai guadagnato #{@item.quantity} punti #{@item.translated_attribute}."
    else
      flash[:error] = "Non hai abbastanza soldi per comprare questo oggetto!"
    end
    redirect_to shopping_items_path
  end
  
  def sell
    @item = Item.find(params[:id])
    current_user.sell(@item)
    flash[:notice] = "Hai veduto l'oggetto per &euro; #{@item.price/2}."
    redirect_to shopping_items_path
  end
  
  def index
    @items = Item.all(:order => 'rank_id')
  end
  
  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(params[:item])
    if @item.save
      flash[:notice] = 'Item was successfully created.'
      redirect_to items_path
    else
      render :action => "new"
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item])
      flash[:notice] = 'Item was successfully updated.'
      redirect_to items_path
    else
      render :action => "edit"
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end
end
