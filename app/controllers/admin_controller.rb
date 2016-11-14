class AdminController < ApplicationController
  def show
    if session[:status_user]!=1
      redirect_to home_path
    end
  end
  def persons
    if session[:status_user]!=1
      redirect_to home_path
    end
  end
end
