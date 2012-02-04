require 'spec_helper'

describe "numbers/new" do
  before(:each) do
    assign(:number, stub_model(Number,
      :number => 1
    ).as_new_record)
  end

  it "renders new number form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => numbers_path, :method => "post" do
      assert_select "input#number_number", :name => "number[number]"
    end
  end
end
