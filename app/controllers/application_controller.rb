class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
   private
  def encrypt(str)
    if  str.nil? == false
      temp=Digest::SHA1.hexdigest str.reverse+(Digest::SHA1.hexdigest str)
      return Digest::SHA1.hexdigest (temp.reverse+str)
    end
  end
end
