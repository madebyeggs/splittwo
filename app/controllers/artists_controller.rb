class ArtistsController < ApplicationController
  before_action :authenticate_user!, :except => ["index", "show"]
  
    def new
      @artist = Artist.new
    end

    def create
      @artist = Artist.create(artist_params)
      respond_to do |format|
        format.html { redirect_to admins_artists_path }
      end
    end

    def edit
      @artist = Artist.find_by_slug(params[:id])
    end

    def update   
      @artist = Artist.find_by_slug(params[:id])
      if @artist.update_attributes(artist_params)
        respond_to do |format|
         format.html { redirect_to admins_artists_path }
         format.json { render :json => @artist }
        end
      else
        respond_to do |format|
          format.html { render :action  => :edit } # edit.html.erb
          format.json { render :nothing =>  true }
        end
      end
    end

    def destroy
      @artist = Artist.find_by_slug(params[:id])
      @artist.destroy
      respond_to do |format|
        format.html { redirect_to admins_artists_path }
      end
    end
    
    def import
      Artist.import(params[:file])
      redirect_to admins_artists_path, notice: "Artists imported!" 
    end
    
    def index
      @artists = Artist.rank(:row_order).all
      set_meta_tags :og => {
        :url => "#{@currentUrl}",
        :title    => 'Split Music | Artists',
        :description => '21st Century Music Publishing | Unique Music to Picture'
      }
      set_meta_tags twitter: {
        card: "summary_large_image",
        site: "@fairsplitmusic",
        title: "Split Music | Artists",
        description: "21st Century Music Publishing | Unique Music to Picture"
      }
    end
    
    def show
      @artist = Artist.find_by_slug(params[:id])
      set_meta_tags og: {
        url: "#{@currentUrl}",
        image: "#{@artist.fb_image}",
        title: "#{@artist.name}",
        description: "#{@artist.description}",
        type: "musician"
      }
      set_meta_tags twitter: {
        card: "summary_large_image",
        site: "@fairsplitmusic",
        title: "#{@artist.name}",
        description: "#{@artist.description}",
        image: "#{@artist.fb_image}"
      }
      render :show, flush: true
    end

    def update_row_order
      @artist = Artist.find(artist_params[:artist_id])
      @artist.row_order_position = artist_params[:row_order_position]
      @artist.save
      render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end
    
    def artist_params
      params.require(:artist).permit(:artist_id, :name, :description, :soundcloud, :fb_url, :twitter_name, :image, :fb_image, :hero, :row_order_position, 
      :slideshow, :slide_image, :slide_title, :slide_title2, :slide_title3, :vimeo, :Slideshowposition, :platform, :nltitle, :nltitle2, :nlsubtitle, :nldescription, :nlsubtitle, :newsletter, :newsletterposition)
    end

end