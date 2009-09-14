require File.dirname(__FILE__) + '/../spec_helper'

describe Message do
  it 'should require image' do
    Message.new.should have(1).error_on(:image)
  end
  
  it 'should require body' do
    Message.new.should have(1).error_on(:body)
  end
  
  it 'should require category' do
    Message.new.should have(1).error_on(:category)
  end
end