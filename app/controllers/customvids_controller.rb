class CustomvidsController < ApplicationController
  before_action :authenticate_user!, :except => ["index", "show"]
  
    def new
      @customvid = Customvid.new
    end

    def create
      @customvid = Customvid.create(customvid_params)
      respond_to do |format|
        format.html { redirect_to admins_customvids_path }
      end
    end

    def edit
      @customvid = Customvid.find(params[:id])
    end

    def update   
      @customvid = Customvid.find(params[:id])
      if @customvid.update_attributes(customvid_params)
        respond_to do |format|
         format.html { redirect_to admins_customvids_path }
         format.json { render :json => @customvid }
        end
      else
        respond_to do |format|
          format.html { render :action  => :edit } # edit.html.erb
          format.json { render :nothing =>  true }
        end
      end
    end

    def destroy
      @customvid = Customvid.find_by_slug(params[:id])
      @customvid.destroy
      respond_to do |format|
        format.html { redirect_to admins_customvids_path }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_customvid
      @customvid = Customvid.find(params[:id])
    end
    
    def customvid_params
      params.require(:customvid).permit(:vimeo_id, :campaign_title, :brand_name, :custom_id)
    end
  
end