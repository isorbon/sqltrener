class UsesController < ApplicationController
  def new

  end
  def db_con

  end
  def update

    if Use.update(use_param)
      redirect_to admin_path
    else
      render 'db_con'
    end
  end
  private

  def use_param
    sgh= params.permit(:gemn,:user_name,:password,:host,:db,:dtp)
    if sgh[:dtp] == 'sj1'
      return {db_base: "#{sgh[:gemn]}://#{sgh[:user_name]}:#{sgh[:password]}@#{sgh[:host]}/#{sgh[:db]}"}
      elsif sgh[:dtp] == 'sj2'
      return {db_shadow: "#{sgh[:gemn]}://#{sgh[:user_name]}:#{sgh[:password]}@#{sgh[:host]}/#{sgh[:db]}"}
    end
  end
end

