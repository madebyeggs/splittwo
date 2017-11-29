class WorksController < ApplicationController
  before_action :authenticate_user!, :except => ["index", "show"]
  
    def new
      @work = Work.new
    end

    def create
      @work = Work.create(work_params)
      respond_to do |format|
        format.html { redirect_to admins_placements_path }
      end
    end

    def edit
      @work = Work.find_by_slug(params[:id])
    end

    def update   
      @work = Work.find_by_slug(params[:id])
      if @work.update_attributes(work_params)
        respond_to do |format|
         format.html { redirect_to admins_placements_path }
         format.json { render :json => @work }
        end
      else
        respond_to do |format|
          format.html { render :action  => :edit } # edit.html.erb
          format.json { render :nothing =>  true }
        end
      end
    end

    def destroy
      @work = Work.find_by_slug(params[:id])
      @work.destroy
      respond_to do |format|
        format.html { redirect_to admins_placements_path }
      end
    end
    
    def import
      Work.import(params[:file])
      redirect_to admins_placements_path, notice: "Works imported!" 
    end
    
    def index
      @works = Work.rank(:row_order).all
      set_meta_tags :og => {
        :url => "#{@currentUrl}",
        :title    => 'Split Music | Placements',
        :description => '21st Century Music Publishing | Unique Music to Picture'
      }
      set_meta_tags twitter: {
        card: "summary_large_image",
        site: "@fairsplitmusic",
        title: "Split Music | Placements",
        description: "21st Century Music Publishing | Unique Music to Picture"
      }
    end
    
    def show
      @work = Work.find_by_slug(params[:id])
      @work_vimeo_mobile = Work.find_by_slug(params[:id]).vimeo[18..-1]
      set_meta_tags og: {
        url: "#{@currentUrl}",
        image: "#{@work.fb_image}",
        title: "#{@work.campaign_title}",
        description: "#{@work.description}",
        type: "musician"
      }
      set_meta_tags twitter: {
        card: "summary_large_image",
        site: "@fairsplitmusic",
        title: "#{@work.campaign_title}",
        description: "#{@work.description}",
        image: "#{@work.fb_image}"
      }
      render :show, flush: true
    end

    def update_row_order
      @work = Work.find(work_params[:work_id])
      @work.row_order_position = work_params[:row_order_position]
      @work.save
      render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_work
      @work = Work.find(params[:id])
    end
    
    def work_params
      params.require(:work).permit(:work_id, :brand_name, :campaign_title, :agency, :track_name, :artist_name, :description, :image, 
      :fb_image, :slideshow, :slide_image, :slide_title, :slide_title2, :slide_title3, :row_order_position, :vimeo, :Slideshowposition, :platform)
    end
  
end