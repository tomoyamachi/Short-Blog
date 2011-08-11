require 'spec_helper'

describe Category do
    context "#create with factory" do
    it "create f_article" do
      a = Factory.build(:f_category)
      a.should be_valid
    end
  end
end
