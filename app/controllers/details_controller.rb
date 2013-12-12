class DetailsController < ApplicationController
  before_filter :require_correct_user!, only: [:create, :edit, :new]

  def create
    @detail = Detail.new(params[:detail])

    if @detail.save
      redirect_to user_url(current_user)
    else
      render :json => @detail.errors.full_messages
    end
  end
end
