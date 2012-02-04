require 'spec_helper'

describe "numbers/convert" do
  before(:each) do
    @number = assign(:number, stub_model(Number,
      :number => 12, :converted_number => 'twelve',
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/Original number:.*12/m)
    rendered.should match(/Converted number:.*twelve/m)
  end
end
