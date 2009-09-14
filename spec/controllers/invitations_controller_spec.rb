require File.dirname(__FILE__) + '/../spec_helper.rb'
describe InvitationsController do
  
  # NEW
  it 'should redirect to auth page' do
    get :new
    response.should be_redirect
  end
  
  it 'should get new' do
    facebook_get :new
    response.should be_success
  end
  
  it 'should use fb:redirect' do
    facebook_get :new, :fb_sig_user => nil
    response.body.should =~ /<fb:redirect/
  end
  
  it 'should get new with from param' do
    # simulo la chiamata di aggiornamento al profilo quando viene
    # passato il parametro from
    controller.should_receive(:update_profile).and_return(true)
    facebook_get :new, :from => 1
    response.should be_success
  end
  
  it 'should not call update_profile' do
    # senza parametro from il metodo non
    # dovrebbe essere chiamato
    controller.should_not_receive(:update_profile)
    facebook_get :new
  end
  
  # CREATE
  it 'should post create' do
    facebook_post :create, :ids => ['1234']
    response.should be_success
    response.should render_template(:create)
  end
end