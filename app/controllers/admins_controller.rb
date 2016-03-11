class AdminsController < ApplicationController
  before_action :authenticate_user!
  
  def artists
    @artists = Artist.rank(:row_order).all
    respond_to do |format|
      format.html
      format.json {render :json => @artists}
    end
  end
  
  def placements
    @works = Work.rank(:row_order).all
    respond_to do |format|
      format.html
      format.json {render :json => @artists}
    end
  end
  
end