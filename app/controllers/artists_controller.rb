class ArtistsController < ApplicationController
  before_action :authenticate_user!, :except => ["index", "show"]
  
    def new
      @artist = Artist.new
    end

    def create
      @artist = Artist.create(artist_params)
      respond_to do |format|
        format.html { redirect_to admins_path }
      end
    end

    def edit
      @artist = Artist.find(params[:id])
    end

    def update   
      @artist = Artist.find(params[:id])
      if @artist.update_attributes(artist_params)
        respond_to do |format|
         format.html { redirect_to admins_path }
        end
      else
        render :action => 'edit'
      end
    end

    def destroy
      @artist = Artist.find(params[:id])
      @artist.destroy
      respond_to do |format|
        format.html { redirect_to admins_path }
      end
    end
    
    def index
      @artist = Artist.rank(:row_order).all
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
      params.require(:artist).permit(:artist_id, :name, :description, :soundcloud, :vimeo, :fb_url, :twitter_name, :image, :fb_image, :row_order_position)
    end

end