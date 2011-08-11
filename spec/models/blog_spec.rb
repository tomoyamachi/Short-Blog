require 'spec_helper'
require "digest"
describe Blog do
  context "#create" do
    it "with password comfirm" do
      b = Factory.build(:miss_pass_conf)
      b.should_not be_valid
    end
    before do
      @blog = Factory.create(:myblog)
    end
    it "has_many articles" do
      Factory.create(:f_article)
      Factory.create(:t_article)
      @blog.should have(2).articles
    end
    it "#encrypt_password" do
      @blog.encrypted_password.should == Digest::SHA2.hexdigest("test")
    end
    context "#has_password" do
      it { @blog.has_password?("test").should be_true }
      it { @blog.has_password?("miss_password").should_not be_true }
    end
  end
end
