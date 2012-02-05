require 'spec_helper'

describe Number do
  # Number is no longer an ActiveRecord, therefore this needs to be checked
  it 'initializes properly' do
    params = { :number => '123' }
    Number.new(params).number.should == '123'
  end
  
  it 'converts numbers to strings properly' do
    input = [7, 42, 2001, 1999]
    expected = ['seven', 'forty-two', 'two thousand and one', 'nineteen hundred and ninety-nine']
    input.each_with_index do |number, i|
      Number.new(:number => number).converted_number.should eq(expected[i])
    end
  end
  
  it 'only accepts proper numbers' do
    Number.new(number: "asd123").should_not be_valid
    Number.new(number: "123asd").should_not be_valid
  end
end
