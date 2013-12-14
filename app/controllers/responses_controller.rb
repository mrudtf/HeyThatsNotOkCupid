class ResponsesController < ApplicationController
  def create
    @response = Response.new(params[:response])

    if @response.save
      redirect_to user_responses_url(current_user)
    else
      @question = @response.question
      flash[:errors] = @response.errors.full_messages

      render :new
    end
  end

  def index
    @user = User.find(params[:user_id])
    @responses = Response.find_all_by_user_id(params[:user_id])
    if @user == current_user
      @unanswered_question = (Question.all - @user.answered_questions).first
    end
  end

  def edit
    @response = Response.find(params[:id])
    redirect_to user_responses_url(current_user) unless @response.user ==
     current_user
    @question = @response.question
  end

  def new
    @question = Question.find(params[:id])
  end

  def update
    @response = Response.find(params[:id])
    if @response.update_attributes(params[:response])
      redirect_to user_responses_url(current_user)
    else
      flash[:errors] = @response.errors.full_messages
      @question = @response.question
      render :edit
    end
  end
end