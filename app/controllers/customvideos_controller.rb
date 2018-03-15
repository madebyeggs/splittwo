class CustomvideosController < ApplicationController
  before_action :authenticate_user!, :except => ["index", "show"]
  
  def new
    @customvideo = Customvideo.new
  end

  def create
    @customvideo = Customvideo.create(customvideo_params)
    respond_to do |format|
      format.html { redirect_to admins_customs_path }
    end
  end

  def edit
    @customvideo = Customvideo.find_by_slug(params[:id])
  end

  def update   
    @customvideo = Customvideo.find_by_slug(params[:id])
    if @customvideo.update_attributes(customvideo_params)
      respond_to do |format|
       format.html { redirect_to admins_customs_path }
       format.json { render :json => @customvideo }
      end
    else
      respond_to do |format|
        format.html { render :action  => :edit } # edit.html.erb
        format.json { render :nothing =>  true }
      end
    end
  end

  def destroy
    @customvideo = Customvideo.find_by_slug(params[:id])
    @customvideo.destroy
    respond_to do |format|
      format.html { redirect_to admins_customs_path }
    end
  end

  def update_row_order
    @customvideo = Customvideo.find(customvideo_params[:customvideo_id])
    @customvideo.row_order_position = customvideo_params[:row_order_position]
    @customvideo.save
    render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_customvideo
    @customvideo = Customvideo.find(params[:id])
  end
  
  def customvideo_params
    params.require(:customvideo).permit(:customvideo_id, :description, :row_order_position, :vimeo, :work_campaign_title, 
    :work_brand_name, :platform, :custom_id, :showreelposition, :showreel)
  end  
end