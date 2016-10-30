class UsersController < ApplicationController
  def iam

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #sign_in @user
      redirect_to iam
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:fname,:lname,:login,:password,:img,:typ)
  end

end
