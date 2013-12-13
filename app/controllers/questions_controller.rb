class QuestionsController < ApplicationController
  def index
    # refactor this to not query the shit out of the db
    unanswered_questions = Question.all - current_user.answered_questions
    @unanswered_question = unanswered_questions.first
    @questions = current_user.answered_questions
  end
end