class ResearchesController < ApplicationController
  before_action :authenticate_user!, :except => ["index", "show"]
  
    def new
      @research = Research.new
    end

    def create
      @research = Research.create(research_params)
      respond_to do |format|
        format.html { redirect_to admins_researches_path }
      end
    end

    def edit
      @research = Research.find_by_slug(params[:id])
    end

    def update   
      @research = Research.find_by_slug(params[:id])
      if @research.update_attributes(research_params)
        respond_to do |format|
         format.html { redirect_to admins_researches_path }
         format.json { render :json => @research }
        end
      else
        respond_to do |format|
          format.html { render :action  => :edit } # edit.html.erb
          format.json { render :nothing =>  true }
        end
      end
    end

    def destroy
      @research = Research.find_by_slug(params[:id])
      @research.destroy
      respond_to do |format|
        format.html { redirect_to admins_researches_path }
      end
    end
    
    def index
      @researches = Research.rank(:row_order).all
      set_meta_tags :og => {
        :url => "#{@currentUrl}",
        :title    => 'Split Music | Re-search',
        :description => '21st Century Music Publishing | Unique Music to Picture'
      }
      set_meta_tags twitter: {
        card: "summary_large_image",
        site: "@fairsplitmusic",
        title: "Split Music | Re-search",
        description: "21st Century Music Publishing | Unique Music to Picture"
      }
    end
    
    def show
      @research = Research.friendly.find(params[:id])
      set_meta_tags og: {
        url: "#{@currentUrl}",
        image: "#{@research.image}",
        title: "#{@research.name}",
        description: "#{@research.description}",
        type: "musician"
      }
      set_meta_tags twitter: {
        card: "summary_large_image",
        site: "@fairsplitmusic",
        title: "#{@research.name}",
        description: "#{@research.description}",
        image: "#{@research.image}"
      }
      render :show, flush: true
    end

    def update_row_order
      @research = Research.find(research_params[:research_id])
      @research.row_order_position = research_params[:row_order_position]
      @research.save
      render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_research
      @research = Research.find(params[:id])
    end
    
    def research_params
      params.require(:research).permit(:research_id, :title, :row_order_position, :image)
    end
end