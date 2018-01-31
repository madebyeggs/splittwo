class ClogosController < ApplicationController
  
  def new
    @clogo = Clogo.new
  end

  def create
    @clogo = Clogo.create(clogos_params)
    respond_to do |format|
      format.html { redirect_to admins_customs_path }
    end
  end

  def edit
    @clogo = Clogo.find(params[:id])
  end

  def update   
    @clogo = Clogo.find(params[:id])
    if @clogo.update_attributes(clogos_params)
      respond_to do |format|
       format.html { redirect_to admins_customs_path }
       format.json { render :json => @clogo }
      end
    else
      respond_to do |format|
        format.html { render :action  => :edit } # edit.html.erb
        format.json { render :nothing =>  true }
      end
    end
  end

  def destroy
    @clogo = Clogo.find_by_slug(params[:id])
    @clogo.destroy
    respond_to do |format|
      format.html { redirect_to admins_customs_path }
    end
  end
  
  def clogos_params
    params.require(:clogo).permit(:image)
  end
end
