class AdminController < ApplicationController
before_action :set_user, only: [:edit,:destroy]
before_action :tables
    def show
    end
    def edit
    end
    def persons
    end
    def destroy
      if @user.destroy
        redirect_to admin_path
      else
        render 'new'
      end
    end
    def tables
      @tabnam=dec(params[:format])
    end
  private
  def set_user
    if  dec(params[:format]).to_i !=0
      @user = User.find(dec(params[:format]).to_i)
    end
  end
end
