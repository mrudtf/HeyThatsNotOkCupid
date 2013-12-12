class ProfilesController < ApplicationController
  before_filter :require_correct_user!, only: [:create, :edit, :new]

  def create
    @profile = Profile.new(params[:profile])

    if @profile.save
      redirect_to new_detail_url(current_user)
    else
      render :json => @profile.errors.full_messages
    end
  end

  def new
    if current_user.profile
      @profile = current_user.profile
      render :edit
    else
      @profile = Profile.new(min_age: 18, max_age: 99, max_distance: 50)
    end
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    @profile.update_attributes(params[:profile])

    redirect_to user_url(current_user)
  end
end