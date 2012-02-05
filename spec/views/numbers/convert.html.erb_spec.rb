require 'spec_helper'

describe "numbers/convert" do
  before(:each) do
    @number = assign(:number, stub_model(Number,
      :number => 12, :converted_number => 'twelve',
    ))
    render
  end

  it "renders numbers" do
    rendered.should match(/Original number:.*12/m)
    rendered.should match(/Converted number:.*twelve/m)
  end
  
  it "renders link to convert another number" do
    rendered.should have_link 'Convert another one'
  end
end
