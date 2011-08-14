class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_infos
  def get_infos
    @right_articles = Article.page(params[:right]).per(10).select('id,title,created_at')
    @categories = Category.all
    if session[:blog]
      @blog = Blog.find(session[:blog])
    end
  rescue
    reset_session
  end
  def confirm_admin
    redirect_to "/" unless @blog
  end
end
