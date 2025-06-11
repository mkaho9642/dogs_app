class Admin::SalonsController < ApplicationController
  layout 'admin'
  def create
    @salon = Salon.new(salon_params)
    if @salon.save
      flash[:notice] = "You have created book successfully."
      redirect_to admin_salon_path(@salon), notice: "サロンを登録しました"
    else
      @salons = Salon.all
      render :index
    end
  end

  def index
    @salons = Salon.all
    @salon = Salon.new
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def salon_params
    params.require(:salon).permit(:name, :introduction,:image)
  end
end
