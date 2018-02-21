class AdminsController < ApplicationController
  before_action :authenticate_user!
  
  def artists
    @artists = Artist.rank(:row_order).all
    respond_to do |format|
      format.html
      format.json {render :json => @artists}
    end
  end
  
  def placements
    @works = Work.search(params[:search]).rank(:row_order).all
  end
  
  def releases
    @releases = Release.search(params[:search]).rank(:row_order).all
  end
  
  def announcements
    @announcements = Announcement.rank(:row_order).all
    respond_to do |format|
      format.html
      format.json {render :json => @announcements}
    end
  end
  
  def slideshow
    define_slides
    respond_to do |format|
      format.html
      format.json {render :json => @slides}
    end
  end
  
  def newsletter
    define_newsletters
    respond_to do |format|
      format.html
      format.json {render :json => @newsletters}
    end
  end
  
  def researches
    @researches = Research.rank(:row_order).all
  end
  
  def customs
    @releases = Release.rank(:row_order).all
    @customs = Custom.rank(:row_order).all
    custom_display = Custom.where('display = ?', true)
    custom_not_displays = Custom.where('display = ?', false)
    @customs_d = custom_display.rank(:row_order).all
    @customs_nd = custom_not_displays
    @clogo = Clogo.first
    respond_to do |format|
      format.html
      format.json {render :json => @customs}
    end
  end
  
end