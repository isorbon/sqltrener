class BlockController < ApplicationController
  def show
  end
  def create
    @uses = User.find_by_secret(sj_params[:secret])
    if @uses && session[:user_id]!=nil&&session[:status_user]==1
      redirect_to admin_path
    else
      session[:user_id]=nil
      session[:status_user]=nil
      redirect_to signin_path
    end
  end
  private
  def sj_params
    sgh= params.permit(:secret)
    return {secret:encrypt(sgh[:secret])}
  end
end
