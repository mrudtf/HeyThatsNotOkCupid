class SessionsController < ApplicationController
  before_filter :require_no_current_user!, only: [:create, :new]
  skip_before_filter :require_current_user!, except: [:destroy]

  def create
    user = User.find_by_credentials(
      params[:user][:name],
      params[:user][:password]
    )

    if user.nil?
      flash[:errors] = ["Credentials were wrong"]
      render :new
    else
      self.current_user = user
      if [params[:loc][:latitude], params[:loc][:longitude]].none? { |n| n.empty? }
        user.update_attributes(params[:loc])
      end
      redirect_to root_url
    end
  end

  def destroy
    current_detail = current_user.detail
    current_detail.last_on = Time.now
    current_detail.save

    logout_current_user!
    redirect_to new_session_url
  end
end