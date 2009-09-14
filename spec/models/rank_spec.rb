require File.dirname(__FILE__) + '/../spec_helper.rb'

describe Rank do
  it 'new rank should need level' do
    Rank.new.should have(1).error_on(:level)
  end
  
  it 'new rank should need name' do
    Rank.new.should have(1).error_on(:name)
  end
  
  it 'new rank should need min_experience' do
    Rank.new.should have(1).error_on(:min_experience)
  end
  
  it 'should be valid' do
    Rank.create!(:name => '1', :level => 1, :min_experience => 0)
  end
  
  describe 'SET_INITIAL_RANK' do
    it 'should return the first available rank' do
      rank = Factory(:rank)
      Rank.initial_rank.should == rank
    end
  end
end