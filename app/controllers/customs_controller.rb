class CustomsController < ApplicationController
  before_action :authenticate_user!, :except => ["index", "show"]
  
    def new
      @custom = Custom.new
    end

    def create
      @custom = Custom.create(custom_params)
      respond_to do |format|
        format.html { redirect_to admins_customs_path }
      end
    end

    def edit
      @custom = Custom.find_by_slug(params[:id])
    end

    def update   
      @custom = Custom.find_by_slug(params[:id])
      if @custom.update_attributes(custom_params)
        respond_to do |format|
         format.html { redirect_to admins_customs_path }
         format.json { render :json => @custom }
        end
      else
        respond_to do |format|
          format.html { render :action  => :edit } # edit.html.erb
          format.json { render :nothing =>  true }
        end
      end
    end

    def destroy
      @custom = Custom.find_by_slug(params[:id])
      @custom.destroy
      respond_to do |format|
        format.html { redirect_to admins_customs_path }
      end
    end
    
    def index
      @customs = Custom.rank(:row_order).all
      set_meta_tags :og => {
        :url => "#{@currentUrl}",
        :title    => 'Split Music | Custom',
        :description => '21st Century Music Publishing | Unique Music to Picture'
      }
      set_meta_tags twitter: {
        card: "summary_large_image",
        site: "@fairsplitmusic",
        title: "Split Music | Custom",
        description: "21st Century Music Publishing | Unique Music to Picture"
      }
    end
    
    def show
      @custom = Custom.find_by_slug(params[:id])
      set_meta_tags og: {
        url: "#{@currentUrl}",
        image: "#{@custom.image}",
        title: "#{@custom.name}",
        description: "#{@custom.description}",
        type: "musician"
      }
      set_meta_tags twitter: {
        card: "summary_large_image",
        site: "@fairsplitmusic",
        title: "#{@custom.name}",
        description: "#{@custom.description}",
        image: "#{@custom.image}"
      }
      render :show, flush: true
    end

    def update_row_order
      @custom = Custom.find(custom_params[:custom_id])
      @custom.row_order_position = custom_params[:row_order_position]
      @custom.save
      render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_custom
      @custom = Custom.find(params[:id])
    end
    
    def custom_params
      params.require(:custom).permit(:custom_id, :name, :description, :row_order_position, :vimeo_1, :vimeo_2, :vimeo_3, :genre, :image)
    end
  
end