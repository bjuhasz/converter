require 'spec_helper'

describe Number do
  it 'can convert' do
    Number.new(:number => 12).converted_number.should eq('twelve')
  end
end
