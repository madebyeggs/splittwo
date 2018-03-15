class ShowreelsController < ApplicationController
  before_action :authenticate_user!, :except => ["index", "show"]
  
  def new
    @showreel = Showreel.new
  end

  def create
    @showreel = Showreel.create(showreel_params)
    respond_to do |format|
      format.html { redirect_to admins_showreel_path }
    end
  end

  def edit
    @showreel = Showreel.find_by_slug(params[:id])
  end

  def update   
    @showreel = Showreel.find_by_slug(params[:id])
    if @showreel.update_attributes(showreel_params)
      respond_to do |format|
       format.html { redirect_to admins_showreel_path }
       format.json { render :json => @showreel }
      end
    else
      respond_to do |format|
        format.html { render :action  => :edit } # edit.html.erb
        format.json { render :nothing =>  true }
      end
    end
  end

  def destroy
    @showreel = Showreel.find_by_slug(params[:id])
    @showreel.destroy
    respond_to do |format|
      format.html { redirect_to admins_showreel_path }
    end
  end

  def update_row_order
    @showreel = Showreel.find(showreel_params[:showreel_id])
    @showreel.row_order_position = showreel_params[:row_order_position]
    @showreel.save
    render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_showreel
    @showreel = Showreel.find(params[:id])
  end
  
  def showreel_params
    params.require(:showreel).permit(:showreel_id, :description, :row_order_position, :vimeo, :work_campaign_title, 
    :work_brand_name, :platform, :showreelposition, :showreel)
  end  
end