class AdvisesController < ApplicationController
  def show
    @advise = Advise.find(params[:id])
  end
  def index
    @advises = Advise.all
  end
  def new
    @advise = Advise.new
  end

  def create
    @advise = Advise.new(advise_params)

    if @advise.save
      redirect_to advises_path
    else
      render :new
    end
  end

  private

  def advise_params
    params.require(:advise).permit(:name, :email, :comment)
  end
end
