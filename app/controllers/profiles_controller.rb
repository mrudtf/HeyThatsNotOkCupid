class ProfilesController < ApplicationController
  before_filter :require_correct_user!, only: [:create, :edit, :new]

  def create
    @profile = Profile.new(params[:profile])

    if @profile.save
      redirect_to user_url(current_user)
    else
      render :json => @user.errors.full_messages
    end
  end
end
