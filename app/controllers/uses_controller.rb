class UsesController < ApplicationController
  def new
  end

  def db_con
  end

  def create
    @uses = Use.find_by_secret(sj_params[:secret])
    if @uses && session[:user_id]!=nil&&session[:typ]==1
        redirect_to admin_path
    else
      render 'new'
    end
    end
  private
  def sj_params
    sgh= params.permit(:secret,:'g-recaptcha-response')
    return {secret:(sgh[:secret])}
  end
end
