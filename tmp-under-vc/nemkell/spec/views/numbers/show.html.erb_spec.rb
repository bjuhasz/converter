require 'spec_helper'

describe "numbers/show" do
  before(:each) do
    @number = assign(:number, stub_model(Number,
      :number => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
