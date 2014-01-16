class QuestionsController < ApplicationController
  def create
    @question = Question.new(params[:question])
    params[:answers].each do |key, value|
      params[:answers].delete(key) if params[:answers][key][:body] == ""
    end
    @question.answers.new(params[:answers].values)

    if @question.save
      flash[:errors] = ["Thanks for submitting a question!"]
      redirect_to user_url(current_user)
    else
      flash[:errors] = @question.errors.full_messages
      render :new
    end
  end
end