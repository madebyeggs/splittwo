class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def define_slides
    @slide_announcements = Announcement.where('slideshow = ?', true)
    @slide_artists = Artist.where('slideshow = ?', true)
    @slide_works = Work.where('slideshow = ?', true)
    @slide_releases = Release.where('slideshow = ?', true)
    @slides = @slide_announcements + @slide_artists + @slide_works + @slide_releases.order('created_at ASC')
    @slides_again= [@slide_announcements, @slide_artists, @slide_works, @slide_releases].flatten
    @sorted_slides = @slides_again.sort_by { |item| item.created_at.strftime('%m/%d/%y') }
    #@slides = Announcement.where("slideshow = ?", true) & Artist.where("slideshow = ?", true) & Work.where("slideshow = ?", true) & Release.where("slideshow = ?", true)
  end
  
end