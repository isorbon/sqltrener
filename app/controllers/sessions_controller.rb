class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_login(session_params[:login])
  if user && authenticate(session_params[:login],session_params[:password])
      session[:user_id] = user.id
      session[:typ] = user.typ
      if user.typ== 0
        redirect_to im_path
      else
        redirect_to tour_path
      end
    else
      render 'new'
    end
  end

  def destroy
        session[:user_id] =nil
        redirect_to root_path
  end

  private
  def encrypt(str)
    if  str.nil? == false
      temp=Digest::SHA1.hexdigest str.reverse+(Digest::SHA1.hexdigest str)
      return Digest::SHA1.hexdigest (temp.reverse+str)
    end
  end
  def session_params
    sgh= params.permit(:login,:password)
    return {login: sgh[:login],password:encrypt(sgh[:password])}
  end
  def authenticate(login, password)
    user = User.find_by_login(login)
    if user && user[:password] == password
      user
    else
      nil
    end
  end
end
