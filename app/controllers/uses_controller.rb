class UsesController < ApplicationController
  def new
    chack_ed
  end
  def db_con
    chack_ed
  end
  def update
    chack_ed
    if Use.update(use_param)
      redirect_to admin_path
    else
      render 'db_con'
    end
  end
  private
  def chack_ed
    if session[:user_id]!=current_user && session[:status_user]!=1
      redirect_to home_path
    end
  end
  def use_param
    sgh= params.permit(:gemn,:user_name,:password,:host,:db,:dtp)
    if sgh[:dtp] == 'sj1'
      return {db_base: "#{sgh[:gemn]}://#{sgh[:user_name]}:#{sgh[:password]}@#{sgh[:host]}/#{sgh[:db]}"}
      elsif sgh[:dtp] == 'sj2'
      return {db_shadow: "#{sgh[:gemn]}://#{sgh[:user_name]}:#{sgh[:password]}@#{sgh[:host]}/#{sgh[:db]}"}
    end
  end
end

