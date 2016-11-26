class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
  def encrypt(str)
    if  str.nil? == false
      temp=Digest::SHA1.hexdigest str.reverse+(Digest::SHA1.hexdigest str)
      return Digest::SHA1.hexdigest (temp.reverse+str)
    end
  end
  private
  def dec(text)
    if text.nil? == false
      return  (Base64.decode64( Base64.decode64( text)))
    end
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

end



