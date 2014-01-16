class ProfilesController < ApplicationController
  before_filter :require_correct_user!, only: [:create, :edit, :new, :update,
     :destroy]

  # Now created by user
  def create
  end

  # Now created by user
  def new
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