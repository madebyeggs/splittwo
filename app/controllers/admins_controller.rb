class AdminsController < ApplicationController
  
  def index
    @artists = Artist.rank(:row_order).all
  end
  
end