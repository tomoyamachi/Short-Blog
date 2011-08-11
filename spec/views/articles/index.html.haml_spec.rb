require 'spec_helper'

describe "articles/index.html.haml" do
  before(:each) do
    assign(:articles, [
      stub_model(Article,
        :title => "Title",
        :description => "MyText"
      ),
      stub_model(Article,
        :title => "Title",
        :description => "MyText"
      )
    ])
  end


end
