class MessagesController < ApplicationController
  def new
    @conversation = Conversation.find_by_unordered_ids(current_user.id, params[:user_id].to_i)

    if @conversation
      redirect_to conversation_url(@conversation)
    else
      @user = User.find_by_id(params[:user_id])
    end
  end

  def create
    @conversation = Conversation.find_or_create_by_ids(current_user.id, params[:user_id].to_i)
    params[:message][:sender_id] = current_user.id
    params[:message][:receiver_id] = params[:user_id]
    @message = @conversation.messages.new(params[:message])

    @conversation.save # add error checking

    redirect_to conversation_url(@conversation)
  end
end