ActionController::Routing::Routes.draw do |map|
  map.resources :invitations
  map.root :controller => 'invitations', :action => 'new'
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
