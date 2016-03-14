class FamiliesController < ApplicationController

  def index
    @families = Family.all
  end

  def show
    @family = Family.find_by(id: params[:id])
    # @current_user = current_user
  end

  def new
    @family = Family.new
  end

  def edit
    @family = Family.find_by(id: params[:id])
  end

  def create
    @family = Family.new(family_params)

    if @family.save
      # code here
    else
      # code here
    end
  end

  def update
    @family = Family.find_by(id: params[:id])
    @family.update_attributes(family_params)
  end

  def destroy
    @family = Family.find_by(id: params[:id])
    if @family.destroy
      # code here
    else
      # code here
    end
  end

  private

  def family_params
    params.require(:family).permit(:first_name, :last_name, :email, :address, :city, :zip_code, :encrypted_password)
  end

end
