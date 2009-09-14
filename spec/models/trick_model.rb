require File.dirname(__FILE__) + '/../spec_helper.rb'

describe Trick do
  it 'should need name' do
    Trick.new.should have(1).error_on(:name)
  end
  
  it 'should need difficulty' do
    Trick.new.should have(1).error_on(:difficulty)
  end
  
  it 'should need rank' do
    Trick.new.should have(1).error_on(:rank)
  end
  
  it 'should be valid' do
    Trick.create!(:name => 'ollie', :difficulty => 0, :rank => mock_model(Rank))
  end
end