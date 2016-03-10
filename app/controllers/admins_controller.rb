class AdminsController < ApplicationController
  
  def index
    @artists = Artist.rank(:row_order).all
    respond_to do |format|
      format.html
      format.json {render :json => @artists}
    end
  end
  
end