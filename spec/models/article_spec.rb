require 'spec_helper'

describe Article do
  before(:each) do
    @attr = { :title => "test", :description => "this is sample contents."}
  end
  context "#create" do
    it "create article" do
      a = Article.new(@attr)
      a.should be_valid
    end
    it "require title" do
      no_title = Article.new(@attr.merge(:title => ""))
      no_title.should_not be_valid
    end
    it "require desc" do
      no_title = Article.new(@attr.merge(:description => ""))
      no_title.should_not be_valid
    end
    it "reject too long title" do
      long = "a" * 51
      long_title = Article.new(@attr.merge(:title => long))
      long_title.should_not be_valid
    end
  end

  context "#create with factory" do
    it "has title characters" do
      a = Factory.build(:f_article)
      a.should be_valid
    end
    it "has no title characters" do
      a = Factory.build(:s_article)
      a.should_not be_valid
    end
    it "confirm #has_many" do
      a = Factory.create(:two_categories_article)
      a.should have(2).categories
    end
  end
end
