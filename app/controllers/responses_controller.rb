class ResponsesController < ApplicationController
  def create
    @response = Response.new(params[:response])
    if @response.save
      # probably need to make this an entirely different path
      if request.xhr?
        render partial: "comparison", locals: {my_resp: @response}
      else
        redirect_to user_url(current_user)
      end
    else
      @question = @response.question
      flash[:errors] = @response.errors.full_messages

      render :new
    end
  end

  def index
    # Moved to user#show for partial

    # @user = User.find(params[:user_id])
    # @responses = Response.find_all_by_user_id(params[:user_id])
    # if @user == current_user
    #   @unanswered_question = (Question.all - @user.answered_questions).first
    # end
  end

  def edit
    @response = Response.find(params[:id])
    redirect_to user_url(current_user) unless @response.user ==
     current_user
    @question = @response.question
  end

  def new
    @question = Question.find(params[:id])

    # Should happen by default anyway
    # render :new if request.xhr?
  end

  def update
    @response = Response.find(params[:id])
    if @response.update_attributes(params[:response])
      redirect_to user_url(current_user)
    else
      flash[:errors] = @response.errors.full_messages
      @question = @response.question
      render :edit
    end
  end
end