class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def define_slides
    @slide_announcements = Announcement.where('slideshow = ?', true)
    @slide_artists = Artist.where('slideshow = ?', true)
    @slide_works = Work.where('slideshow = ?', true)
    @slide_releases = Release.where('slideshow = ?', true)
    #@slides = @slide_announcements + @slide_artists + @slide_works + @slide_releases.order('created_at ASC')
    @slides = [@slide_announcements, @slide_artists, @slide_works, @slide_releases].flatten
    @sorted_slides = @slides.sort_by {|slide| [slide.Slideshowposition ? 0 : 1,slide.Slideshowposition || 0]}
  end
  
  def define_customs
    @custom_count = Custom.where('display = ?', true).count
    @custom_displays = Custom.where('display = ?', true)
    @sorted_custom_displays = @custom_displays.rank(:row_order).all
  end
  
end