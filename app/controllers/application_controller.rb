class ApplicationController < ActionController::Base
  def require_is_admin
    if !current_user.admin?
      flash[:alert] = 'You are not admin'
      redirect_to root_path
    end
  end
  def require_is_manger
    if !current_user.manger?
      flash[:alert] = 'You are not manger'
      redirect_to root_path
    end
  end
  protect_from_forgery with: :exception
end
