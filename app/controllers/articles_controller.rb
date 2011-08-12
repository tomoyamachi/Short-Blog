class ArticlesController < ApplicationController
  before_filter :confirm_admin, :except => [:index,:show,:destroy]
  def index
    p @blog
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end

  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params[:article])
    begin
      @category = Category.find(params[:categories].to_i)
      if @category
        @article.categories << @category
        @category.article_num = @article.categories.size + 1
        @category.save
      end
    rescue
    end

    respond_to do |format|
      if @article.save
        format.html { redirect_to(@article, :notice => 'Article was successfully created.') }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @article = Article.find(params[:id])
    begin
      @category = Category.find(params[:categories].to_i)
      if @category
        @article.categories << @category
        @category.article_num = @article.categories.size + 1
        @category.save
      end
    rescue
    end
    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to(@article, :notice => 'Article was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.delete

    respond_to do |format|
      format.html { redirect_to "/" }
      format.xml  { head :ok }
    end
  end
end
