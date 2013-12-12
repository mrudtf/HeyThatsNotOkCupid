class MessagesController < ApplicationController
  def new
    @user = User.find_by_id(params[:user_id])
  end

  def create
    if current_user.id < params[:user_id].to_i
      low_id = current_user.id
      high_id = params[:user_id].to_i
    else
      low_id = params[:user_id].to_i
      high_id = current_user.id
    end

    @conversation = Conversation.find_or_create_by_ids(low_id, high_id)
    params[:message][:sender_id] = current_user.id
    params[:message][:receiver_id] = params[:user_id]
    @message = @conversation.messages.new(params[:message])

    @conversation.save # add error checking

    redirect_to conversation_url(@conversation)
  end
end