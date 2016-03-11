class ReleasesController < ApplicationController
  before_action :authenticate_user!, :except => ["index", "show"]
  
    def new
      @release = Release.new
    end

    def create
      @release = Release.create(release_params)
      respond_to do |format|
        format.html { redirect_to admins_releases_path }
      end
    end

    def edit
      @release = Release.find_by_slug(params[:id])
    end

    def update   
      @release = Release.find_by_slug(params[:id])
      if @release.update_attributes(release_params)
        respond_to do |format|
         format.html { redirect_to admins_releases_path }
         format.json { render :json => @release }
        end
      else
        respond_to do |format|
          format.html { render :action  => :edit } # edit.html.erb
          format.json { render :nothing =>  true }
        end
      end
    end

    def destroy
      @release = Release.find_by_slug(params[:id])
      @release.destroy
      respond_to do |format|
        format.html { redirect_to admins_releases_path }
      end
    end
    
    def import
      Release.import(params[:file])
      redirect_to admins_releases_path, notice: "Releases imported!" 
    end
    
    def index
      @releases = Release.rank(:row_order).all
      set_meta_tags :og => {
        :url => "#{@currentUrl}",
        :title    => 'Split Music | Releases',
        :description => '21st Century Music Publishing | Unique Music to Picture'
      }
      set_meta_tags twitter: {
        card: "summary_large_image",
        site: "@fairsplitmusic",
        title: "Split Music | Releases",
        description: "21st Century Music Publishing | Unique Music to Picture"
      }
    end
    
    def show
      @release = Release.find_by_slug(params[:id])
      set_meta_tags og: {
        url: "#{@currentUrl}",
        image: "#{@release.fb_image}",
        title: "#{@release.title}",
        description: "#{@release.description}",
        type: "musician"
      }
      set_meta_tags twitter: {
        card: "summary_large_image",
        site: "@fairsplitmusic",
        title: "#{@release.title}",
        description: "#{@release.description}",
        image: "#{@release.fb_image}"
      }
      render :show, flush: true
    end

    def update_row_order
      @release = Release.find(release_params[:release_id])
      @release.row_order_position = release_params[:row_order_position]
      @release.save
      render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_release
      @release = Release.find(params[:id])
    end
    
    def release_params
      params.require(:release).permit(:release_id, :title, :soundcloud, :description, :image, :fb_image, :row_order_position)
    end
  
end