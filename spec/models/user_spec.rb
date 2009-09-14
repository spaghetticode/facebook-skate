require File.dirname(__FILE__) + '/../spec_helper.rb'

describe User do
  before do
    Rank.stub!(:initial_rank => Factory(:rank))
  end
  
  it 'should need facebook_id' do
    User.new.should have(1).error_on(:facebook_id)
  end
  
  it 'should be valid' do
    User.create!(:facebook_id => 1)
  end
  
  it 'should update session_key field' do
    user = Factory(:user)
    lambda do
      user.store_session(12345)
    end.should change(user, :session_key)
  end
  
  it 'should have facebook_session' do
    user = Factory(:user)
    user.facebook_session.should_not be_nil
  end
  
  it 'retrieving user should not set @facebook_session' do
    user = User.for(Factory(:user).facebook_id)
    user.instance_variable_get('@facebook_session').should be_nil
  end
  
  it 'should have zero experience' do
    User.new.experience.should be_zero
  end
  
  it 'should have zero stamina' do
    User.new.stamina.should be_zero
  end
  
  it 'should have zero dexterity' do
    User.new.dexterity.should be_zero
  end
  
  it 'should call set_initial_rank' do
    user = User.new(:facebook_id => 1234)
    user.should_receive(:set_initial_rank)
    user.save
  end
  
  it 'should set default rank' do
    user = User.create!(:facebook_id => 1234)
    user.rank.should_not be_nil
  end
  
  describe 'AVAILABLE_TRICKS' do
    before do
      @user = Factory(:user, :rank => mock_model(Rank, :level => 1))
      3.times do |n|
        Factory(:trick, :difficulty => n+1)
      end
    end
    
    it 'should find only 1 available trick' do
      @user.available_tricks.should have(1).trick
    end
    
    it 'should find 3 available tricks' do
      Trick.update_all(:difficulty => 1)
      @user.available_tricks.should have(3).tricks
    end
  end
  
  describe 'HOMETOWN' do
    
    before do
      @user = Factory(:user)
      @fb_user = Facebooker::User.new(1234)
      Facebooker::User.should_receive(:new).and_return(@fb_user)
    end
    
    it 'should return expected string as hometown' do
      @fb_user.stub!(:hometown_location => Facebooker::Location.new(
        :city => 'Lilliput', :state => 'Utopia'
      ))
      @user.hometown.should == 'Lilliput Utopia'
    end
    
    it 'should return default string as hometown' do
      @fb_user.stub!(:hometown_location => Facebooker::Location.new(
        :city => '', :state => ''
      ))
      @user.hometown.should == 'undisclosed location'
    end
  end
  
  describe 'WON_MATCHES & LOST MATCHES' do
    before do
      @user = Factory(:user)
      3.times do
        Match.create!(
          :user => @user,
          :contender => mock_model(User),
          :victory => false
        )
      end
    end
    
    it 'should find no won match' do
      @user.won_matches.should be_empty
    end
    
    it 'should find 3 lost matches' do
      @user.lost_matches.should have(3).matches
    end
    
    it 'should find one won match' do
      Match.first.update_attribute(:victory, true)
      @user.won_matches.should have(1).match
    end
    
    it 'should find 3 won matches' do
      Match.update_all(:victory => true)
      @user.won_matches.should have(3).matches
    end
  end
  
  describe 'TRY_TO_UPDATE' do
    before do
      @user = Factory(:user)
      @user.update_attribute(:experience, @user.rank.min_experience)
      @next_rank = Factory(:rank, :min_experience => @user.experience + 100)
      @user.rank.next_rank = @next_rank
    end
    
    it 'should not update rank' do
      @user.experience = @next_rank.min_experience - 1
      lambda do
        @user.try_to_update
      end.should_not change(@user, :rank)
    end
    
    it 'should update rank' do
      @user.experience = @next_rank.min_experience + 1 
      lambda do
        @user.try_to_update
      end.should change(@user, :rank)
    end
    
    it 'should update rank' do
      @user.experience = @next_rank.min_experience
      lambda do
        @user.try_to_update
      end.should change(@user, :rank)
    end
    
    it 'should not update rank' do
      @user.rank.next_rank = nil
      @user.experience += 1000
      lambda do
        @user.try_to_update
      end.should_not change(@user, :rank)
    end
  end
  
  describe 'TRAINING' do
    before do
      @user = Factory(:user)
    end
    
    it 'should return empty string' do
      @user.trainings.should == ''
    end
    
    it 'should return false eventually' do
      4.times {@user.training.should be_true}
      @user.training.should be_false
    end
    
    it 'should return true' do
      @user.training.should be_true
    end
    
    it 'should rewrite trainings' do
      @user.trainings = Date.yesterday.to_s*4
      lambda do
        @user.training
      end.should change(@user, :trainings).to(Date.today.to_s)
    end
  end
  
  describe 'BUY  & SELL' do
    before do
      @user = Factory(:user)
      @item = Factory(:item)
    end
    
    # BUY
    it 'should return nil (money < price)' do
      @user.money = @item.price-5
      @user.buy(@item).should be_nil
    end
    
    it 'should not return nil' do
      @user.money = @item.price+5
      @user.buy(@item).should_not be_nil
    end
    
    it 'should change @user.money' do
      @user.money = @item.price = 5
      lambda do
        @user.buy(@item)
      end.should change(@user, :money).by(-5)
    end
    
    it 'should change @user.items' do
      @user.money = @item.price
      lambda do
        @user.buy(@item)
      end.should change(@user, :items)
    end
    
    it 'should change stamina' do
      @user.money = @item.price + 10
      lambda do
        @user.buy(@item)
      end.should change(@user, :stamina)
    end
    
    # SELL
    it 'should return nil' do
      @user.sell(@item).should be_nil
    end
    
    it 'should not return nil' do
      @user.items << @item
      @user.sell(@item).should_not be_nil
    end
    
    it 'should change @user.money' do
      @user.items << @item
      lambda do
        @user.sell(@item)
      end.should change(@user, :money).by(@item.price/2)
    end
    
    it 'should remove @item from @user.items' do
      @user.items << @item
      @user.sell(@item)
      @user.items.should_not include(@item)
    end
  end
end