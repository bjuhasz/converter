require 'spec_helper'

describe "numbers/edit" do
  before(:each) do
    @number = assign(:number, stub_model(Number,
      :number => 1
    ))
  end

  it "renders the edit number form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => numbers_path(@number), :method => "post" do
      assert_select "input#number_number", :name => "number[number]"
    end
  end
end
