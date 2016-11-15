class UsersController < ApplicationController
  def show
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
          redirect_to signin_path
          else
          render 'new'
    end
  end
  def update
    if User.update(user_params)
      redirect_to admin_path
    else
      render 'admin/edit'
    end
  end


  private
  def user_params
    sgh= params.permit(:fname,:lname,:login,:password,:img,:status_user)
    if sgh[:status_user]=='1'
      return {fname: sgh[:fname],lname: sgh[:lname],login: sgh[:login],password:encrypt(sgh[:password]),secret:encrypt(sgh[:password].reverse.swapcase),img: sgh[:img],status_user: sgh[:status_user]}
    elsif sgh[:status_user]=='0'
      return {fname: sgh[:fname],lname: sgh[:lname],login: sgh[:login],password:encrypt(sgh[:password]),img: sgh[:img],status_user: sgh[:status_user]}
    else
      return {fname: sgh[:fname],lname: sgh[:lname],login: sgh[:login],password:encrypt(sgh[:password]),img: sgh[:img]}
    end
  end
end
