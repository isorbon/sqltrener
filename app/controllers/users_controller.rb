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

  private
  def encrypt(str)
    if  str.nil? == false
      temp=Digest::SHA1.hexdigest str.reverse+(Digest::SHA1.hexdigest str)
      return Digest::SHA1.hexdigest (temp.reverse+str)
    end
  end
  def user_params
    sgh= params.permit(:fname,:lname,:login,:password,:img,:typ)
    if sgh[:typ]==1
    @us=Use.new({secret: (sgh[:password].reverse.upcase)})
      @us.save
    end

    return {fname: sgh[:fname],lname: sgh[:lname],login: sgh[:login],password:encrypt(sgh[:password]),img: sgh[:img],typ: sgh[:typ]}
  end
end
