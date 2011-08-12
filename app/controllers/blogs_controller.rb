class BlogsController < ApplicationController
  before_filter :confirm_owner, :except => [:login, :signin, :signout]
  # GET /blogs
  # GET /blogs.xml
  def confirm_owner
    if Blog.all.size > 0
      redirect_to '/'
    end
  end
  def signin
    if Blog.authenticate(params[:mail], params[:password])
      session[:blog] = Blog.authenticate(params[:mail], params[:password])
      redirect_to "/"
    else
      redirect_to(:action => "login")
    end
  end
  def signout
    p "Blog#signout"
    sereset_session
    redirect_to "/"
  end
  def index
    @blogs = Blog.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @blogs }
    end
  end

  # GET /blogs/1
  # GET /blogs/1.xml
  def show
    @blog = Blog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @blog }
    end
  end

  # GET /blogs/new
  # GET /blogs/new.xml
  def new
    @blog = Blog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @blog }
    end
  end

  # GET /blogs/1/edit
  def edit
    @blog = Blog.find(params[:id])
  end

  # POST /blogs
  # POST /blogs.xml
  def create
    @blog = Blog.new
    @blog.title = params[:blog][:title]
    @blog.mail = params[:blog][:mail]
    @blog.password = params[:blog][:password]
    @blog.password_confirmation = params[:blog][:password_confirmation]
    respond_to do |format|
      if @blog.save
        format.html { redirect_to(@blog, :notice => 'Blog was successfully created.') }
        format.xml  { render :xml => @blog, :status => :created, :location => @blog }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /blogs/1
  # PUT /blogs/1.xml
  def update
    @blog = Blog.find(params[:id])

    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        format.html { redirect_to(@blog, :notice => 'Blog was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.xml
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to(blogs_url) }
      format.xml  { head :ok }
    end
  end
end
