require 'spec_helper'

describe "blogs/show.html.haml" do
  before(:each) do
    @blog = assign(:blog, stub_model(Blog,
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
  end
end
