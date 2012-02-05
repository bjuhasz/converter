require 'spec_helper'

describe "numbers/new" do
  before(:each) do
    @number = assign(:number, stub_model(Number))
    render
  end

  it "renders new number form" do
    assert_select "form", :action => numbers_convert_path, :method => "get" do
      assert_select "input#number_number", :name => "number[number]"
    end
  end
end
