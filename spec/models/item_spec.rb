require File.dirname(__FILE__) + '/../spec_helper'

describe Item do
  
  it 'should require name' do
    Item.new.should have(1).error_on(:name)
  end
  
  it 'should require description' do
    Item.new.should have(1).error_on(:description)
  end
  
  it 'should require image' do
    Item.new.should have(1).error_on(:image)
  end
  
  it 'should require rank' do
    Item.new.should have(1).error_on(:rank)
  end
  
  it 'should require price' do
    Item.new.should have(1).error_on(:price)
  end
  
  it 'should return "energia"' do
    item = Item.new(:attribute => 'stamina')
    item.translated_attribute.should == 'energia'
  end
  
  it 'should return "dexterity"' do
    item = Item.new(:attribute => 'dexterity')
    item.translated_attribute.should == 'destrezza'
  end
  
  it 'should return "esperienza"' do
    item = Item.new(:attribute => 'experience')
    item.translated_attribute.should == 'esperienza'
  end
  
  it 'should respond to users' do
    Item.new.should respond_to(:users)
  end
end