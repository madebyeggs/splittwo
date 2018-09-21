class NewslettersController < ApplicationController
  before_action :authenticate_user!, :except => ["index", "show"]
  layout "newsletter_layout", :except => ["new", "edit"]

  def index
    define_newsletters
  end
  
  def new
    @newsletter = Newsletter.new
  end

  def create
    @newsletter = Newsletter.create(newsletter_params)
    respond_to do |format|
      format.html { redirect_to admins_newsletter_path }
    end
  end

  def edit
    @newsletter = Newsletter.find(params[:id])
  end

  def update   
    @newsletter = Newsletter.find(params[:id])
    if @newsletter.update_attributes(newsletter_params)
      respond_to do |format|
       format.html { redirect_to admins_newsletter_path }
       format.json { render :json => @newsletter }
      end
    else
      respond_to do |format|
        format.html { render :action  => :edit } # edit.html.erb
        format.json { render :nothing =>  true }
      end
    end
  end

  def destroy
    @newsletter = Newsletter.find(params[:id])
    @newsletter.destroy
    respond_to do |format|
      format.html { redirect_to admins_newsletter_path }
    end
  end
  
  def newsletter_params
    params.require(:newsletter).permit(:title1, :title2, :facebook, :twitter, :instagram, :website, :logo, :mainimage, :downloadlink)
  end

end