class DetailsController < ApplicationController
  before_filter :require_correct_user!, only: [:create, :edit, :new, :update,
     :destroy]

  def create
    @detail = Detail.new(params[:detail])

    if @detail.save
      redirect_to user_url(current_user)
    else
      render :json => @detail.errors.full_messages
    end
  end

  def new
    if current_user.detail
      @detail = current_user.detail
      render :edit
    else
      @detail = Detail.new
    end
  end

  def edit
    @detail = current_user.detail
  end

  def update
    @detail = current_user.detail
    @detail.update_attributes(params[:detail])

    redirect_to user_url(current_user)
  end
end
