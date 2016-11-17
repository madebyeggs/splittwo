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
    @works = Work.rank(:row_order).all
    respond_to do |format|
      format.html
      format.json {render :json => @works}
    end
  end
  
  def releases
    @releases = Release.rank(:row_order).all
    respond_to do |format|
      format.html
      format.json {render :json => @releases}
    end
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
  
  def customs
    @customs = Custom.rank(:row_order).all
    respond_to do |format|
      format.html
      format.json {render :json => @customs}
    end
  end
  
end