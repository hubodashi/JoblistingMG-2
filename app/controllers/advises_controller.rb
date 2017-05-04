class AdvisesController < ApplicationController
  def show
    @advise = Advise.find(params[:id])
  end
  def index
    @advises = Advise.all.paginate(:page => params[:page], :per_page => 5)
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
  def edit
    @advise = Advise.find(params[:id])
  end
  def update
    @advise = Advise.find(params[:id])
    if @advise.update(advise_params)
      redirect_to advises_path
    else
      render :edit
    end
  end
  def destroy
  @advise = Advise.find(params[:id])

  @advise.destroy

  redirect_to advises_path
end
  private

  def advise_params
    params.require(:advise).permit(:name, :email, :comment)
  end
end
