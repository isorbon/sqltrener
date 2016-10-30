class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_login(session_params[:login])
    if user && user.authenticate(params[:session][:password])
      sign_in user

    else
      flash.now[:error] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    #sign_out
    redirect_to root_path
  end

  private
  def session_params
    params.require(:user).permit(:login,:password)
  end

end
