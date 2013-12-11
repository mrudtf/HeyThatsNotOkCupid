module SessionsHelper
  def current_user
    User.find_by_token(session[:token])
  end

  def current_user=(user)
    @current_user = user
    session[:token] = user.token
  end

  def logout_current_user!
    current_user.reset_token!
    session[:token] = nil
  end

  def require_current_user!
    redirect_to new_session_url if current_user.nil?
  end

  def require_no_current_user!
    redirect_to user_url(current_user) unless current_user.nil?
  end

  def require_correct_user!
    redirect_to user_url(current_user) unless current_user.id == params[:id].to_i
  end
end