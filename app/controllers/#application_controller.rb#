class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_infos
  def get_infos
    @articles = Article.all
    @categories = Category.all
    if session['blog']
      @blog = Blog.find(session['blog'])
    end
  end
end
