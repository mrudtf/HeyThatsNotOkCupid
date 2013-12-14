module ResponsesHelper
  def my_response(question_id)
    Response.find_by_user_id_and_question_id(current_user.id, question_id)
  end
end