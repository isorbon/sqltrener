class AdminController < ApplicationController
  before_action :set_user, only: [:edit]
  def set_user
    @user = User.find(params[:format])
  end
  def show
    if session[:status_user]!=1
      redirect_to home_path
    end
  end

  def edit
  end

  def persons
    if session[:status_user]!=1
      redirect_to home_path
    end
  end
  def destroy
    User.delete(params[:format])
  end

end
