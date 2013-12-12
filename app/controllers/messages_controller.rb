class MessagesController < ApplicationController
  def new
    @user = User.find_by_id(params[:user_id])
  end

  def create
    @message = Message.new(params[:message])
    @message.sender_id = current_user.id
    @message.receiver_id = params[:user_id]

    if @message.save
      @conversation = Conversation.new(initiator_id: current_user.id,
       receiver_id: params[:user_id])
      @conversation.save!
      @message.conversation_id = @conversation.id
      @message.save!
      redirect_to conversation_url(@conversation)
    else
      render :new # add error msg
    end
  end
end