class Manger::AdvisesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :require_is_manger
  def show
    @advise = Advise.find(params[:id])
  end

  def index
    @advises = Advise.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @advise = Advise.new
  end

  def create
    @advise = Advise.new(advise_params)

    if @advise.save
      redirect_to manger_advises_path
    else
      render :new
    end
  end

  def edit
    @advise = Advise.find(params[:id])
  end

  def update
    @advise = Advise.find(params[:id])
    if @advise.update(advise_params)
      redirect_to manger_advises_path
    else
      render :edit
    end
  end

  def destroy
    @advise = Advise.find(params[:id])

    @advise.destroy

    redirect_to manger_advises_path
  end

  private

  def advise_params
    params.require(:advise).permit(:name, :email, :comment)
  end
end
