ActionController::Routing::Routes.draw do |map|
  map.resources :messages

  map.resources :items, :collection => {:shopping => :get}, :member => {:buy => :post, :sell => :delete}
  map.resources :invitations
  map.resources :events, :collection => {:choose => :get}
  map.resources :matches do |r|
    r.resources :runs #risorsa fittizia
  end
  
  map.training  '/training',  :controller => 'activities', :action => 'training'
  
  map.root :controller => 'invitations', :action => 'new'
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
