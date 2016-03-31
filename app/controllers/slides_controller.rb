class SlidesController < ApplicationController
  
  def index
    define_slides
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
    @slide = Announcement.find_by_slug(params[:id]) || Artist.find_by_slug(params[:id]) || Work.find_by_slug(params[:id]) || Release.find_by_slug(params[:id])
    set_meta_tags og: {
      url: "#{@currentUrl}",
      image: "#{@slide.fb_image}",
      title: "#{@slide.slide_title}",
      description: "#{@slide.description}",
      type: "musician"
    }
    set_meta_tags twitter: {
      card: "summary_large_image",
      site: "@Fairsplitmusic",
      title: "#{@slide.slide_title}",
      description: "#{@slide.description}",
      image: "#{@slide.fb_image}"
    }
  end
  
end