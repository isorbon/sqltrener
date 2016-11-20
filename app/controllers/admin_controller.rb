class AdminController < ApplicationController
  before_action :set_user, only: [:edit]
  before_action :tables

  def show
    chack_ed
  end

  def edit
    chack_ed
  end

  def persons
    chack_ed
  end
  def destroy
    if User.delete(params[:format])
      redirect_to admin_path
    end
  end

  def tables
    if session[:status_user]!=1
      redirect_to admin_path
    else
      @tabnam=(params[:format])
    end
  end

  private

  def chack_ed
    if session[:user_id]!=current_user && session[:status_user]!=1
      redirect_to home_path
    end
  end

  def set_user
    @user = User.find(params[:format])
  end
end
