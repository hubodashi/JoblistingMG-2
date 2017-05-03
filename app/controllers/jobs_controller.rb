class JobsController < ApplicationController
  before_action :validate_search_key, only: [:search]
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  def show
    @job=Job.find(params[:id])
    if @job.is_hidden
      flash[:warning] = "This Job already archieved"
      redirect_to root_path
    end
  end
  def index
    @jobs= case params[:order]
    when 'by_lower_bound'
      Job.published.order('wage_lower_bound DESC').paginate(:page => params[:page], :per_page => 10)
    when 'by_upper_bound'
      Job.published.order('wage_upper_bound DESC').paginate(:page => params[:page], :per_page => 10)
    else
      Job.published.recent.paginate(:page => params[:page], :per_page => 10)
    end

    if params[:c].present?
        @city = params[:c]
        @jobs = @jobs.where(:city => @city)
      end

    if params[:d].present?
        @category = params[:d]
        @jobs = @jobs.where(:category => @category)
      end

      if params[:e].present?
        @company = params[:e]
        @jobs = @jobs.where(:company => @company)
      end

  end
  def new
    @job=Job.new
  end
  def create
    @job=Job.new(job_params)
    if @job.save
      redirect_to jobs_path
    else
      render :new
  end
 end
  def edit
    @job=Job.find(params[:id])
  end
  def update
    @job=Job.find(params[:id])
    if @job.update(job_params)
      redirect_to jobs_path
    else
      render :edit
    end
  end
  def destroy
    @job=Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path
  end
  def search
  if @query_string.present?
    search_result = Job.published.ransack(@search_criteria).result(:distinct => true)
    @jobs = search_result.recent.paginate(:page => params[:page], :per_page => 5 )
  end
end
 private
 def job_params
   params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :city, :company, :category, :is_hidden)
 end
 protected
  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "")
    if params[:q].present?
      @search_criteria =  {
        title_or_company_or_city_cont: @query_string
      }
    end
  end

  def search_criteria(query_string)
    { :title_cont => query_string }
  end
end
