class UsersController < ApplicationController
  def show
    chack_ed
  end
  def new
    chack_ed
    @user = User.new
  end

  def create
    chack_ed
    @user = User.new(user_params)
    if @user[:status_user]==1&&User.find_by_status_user(1).nil? != false
      if @user.save
        redirect_to signin_path
      else
        render 'new'
      end
        elsif @user[:status_user]==0
        if @user.save
          redirect_to signin_path
        else
          render 'new'
        end
    end
  end
  def update
    chack_ed
    if User.update(user_params)
      redirect_to admin_path
    else
      render 'admin/edit'
    end
  end


  private
  def chack_ed
    if session[:user_id]!=current_user && session[:status_user]==0 |session[:status_user]==1
      redirect_to home_path
    end
  end

  def user_params
    sgh= params.permit(:fname,:lname,:login,:password,:img,:status_user)
    if sgh[:status_user]=='1'
      return {fname: sgh[:fname],lname: sgh[:lname],login: sgh[:login],password:encrypt(sgh[:password]),secret:encrypt(sgh[:password].reverse.swapcase),img: sgh[:img],status_user: sgh[:status_user]}
    elsif sgh[:status_user]=='0'
      return {fname: sgh[:fname],lname: sgh[:lname],login: sgh[:login],password:encrypt(sgh[:password]),img: sgh[:img],status_user: sgh[:status_user]}
    elsif   params[:status_user].nil? == true
      return {fname: sgh[:fname],lname: sgh[:lname],login: sgh[:login],password:encrypt(sgh[:password]),img: sgh[:img]}
    end
  end
end
