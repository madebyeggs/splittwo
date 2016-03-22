class SlidesController < ApplicationController
  
  def index
    define_slides
    @slides = @slide_announcements + @slide_artists
    set_meta_tags :og => {
      :url => "#{@currentUrl}",
      :title    => 'Split Music | News',
      :description => '21st Century Music Publishing | Unique Music to Picture'
    }
    set_meta_tags twitter: {
      card: "summary_large_image",
      site: "@fairsplitmusic",
      title: "Split Music | News",
      description: "21st Century Music Publishing | Unique Music to Picture"
    }
  end
  
  def show
    @slide = Announcement.find_by_slug(params[:id]) || Artist.find_by_slug(params[:id])
  end
  
end