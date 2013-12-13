class ResponsesController < ApplicationController
  def create
    Response.new(params[:response]).save!

    redirect_to questions_url
  end
end
