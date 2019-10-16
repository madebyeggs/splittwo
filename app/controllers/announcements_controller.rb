class AnnouncementsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.create(announcement_params)
    respond_to do |format|
      format.html { redirect_to admins_announcements_path }
    end
  end

  def edit
    @announcement = Announcement.find_by_slug(params[:id])
  end

  def update   
    @announcement = Announcement.find_by_slug(params[:id])
    if @announcement.update_attributes(announcement_params)
      respond_to do |format|
       format.html { redirect_to admins_announcements_path }
       format.json { render :json => @announcement }
      end
    else
      respond_to do |format|
        format.html { render :action  => :edit } # edit.html.erb
        format.json { render :nothing =>  true }
      end
    end
  end

  def destroy
    @announcement = Announcement.find_by_slug(params[:id])
    @announcement.destroy
    respond_to do |format|
      format.html { redirect_to admins_announcements_path }
    end
  end
  
  def import
    Announcement.import(params[:file])
    redirect_to admins_announcements_path, notice: "Announcements imported!" 
  end

  def update_row_order
    @announcement = Announcement.find(announcement_params[:announcement_id])
    @announcement.row_order_position = announcement_params[:row_order_position]
    @announcement.save
    render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_announcement
    @announcement = Announcement.find(params[:id])
  end
  
  def announcement_params
    params.require(:announcement).permit(:announcement_id, :slide_title, :slide_title2, :slide_title3, :description, 
    :soundcloud, :soundcloudtracks, :vimeo, :slide_image, :row_order_position, :slideshow, :Slideshowposition, :fb_image, :platform,
    :newsletter, :newsletterposition, :hero, :nltitle, :nlsubtitle, :nldescription)
  end
end