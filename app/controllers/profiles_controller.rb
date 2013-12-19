class ProfilesController < ApplicationController
  before_filter :require_correct_user!, only: [:create, :edit, :new, :update,
     :destroy]

  def create
    @profile = Profile.new(params[:profile])

    if @profile.save
      redirect_to new_detail_url(current_user)
    else
      flash[:errors] = @profile.errors.full_messages
      render :new
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

    if @profile.update_attributes(params[:profile])
      if request.xhr?
        render partial: "essays", locals: {profile: @profile}
      else
        redirect_to user_url(current_user)
      end
    else
      flash[:errors] = @profile.errors.full_messages
      render :edit
    end
  end
end