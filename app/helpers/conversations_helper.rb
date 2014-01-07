module ConversationsHelper
  def other_user(conversation)
    user_id = ([conversation.high_user_id, conversation.low_user_id] - [current_user.id]).first
    User.find(user_id)
  end
end
