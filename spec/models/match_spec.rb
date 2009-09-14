require File.dirname(__FILE__) + '/../spec_helper.rb'

describe Match do
  
  it 'should need user' do
    Match.new.should have(1).error_on(:user)
  end
  
  it 'should need contender' do
    Match.new.should have(1).error_on(:contender)
  end
  
  it 'should create a new instance' do
    user = Factory(:user)
    contender = Factory(:user)
    Match.create!(:user => user, :contender => contender)
  end
end