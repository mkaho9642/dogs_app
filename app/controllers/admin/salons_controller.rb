class Admin::SalonsController < ApplicationController
  layout 'admin'

  def index
    @salons = Salon.all
  end

  def new
    @salon = Salon.new
  end

  def create
    @salon = Salon.new(salon_params)
    if @salon.save
      redirect_to admin_salon_path(@salon), notice: "サロンを登録しました"
    else
      render :new
    end
  end

  def show
    @item = Salon.find(params[:id])
  end

  def edit
  end

  def update
    if @salon.update(salon_params)
      redirect_to admin_salon_path(@salon)
    else
      render :edit
  end

  def destroy
  end

  private
    def set_salon
      @salon = Salon.find(params[:id])
    end

    def salon_params
      params.require(:salon).permit(:name, :introduction,:image)
    end
  end
end
