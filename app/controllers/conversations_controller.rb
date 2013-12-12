class ConversationsController < ApplicationController

  def show
    @conversation = Conversation.includes(:messages).find(params[:id])

    unless @conversation.low_user_id == current_user.id ||
      @conversation.high_user_id == current_user.id
        redirect_to user_url(current_user)
    end

    @messages = @conversation.messages.order("created_at ASC")
    @recipient = [@conversation.low_user_id,
      @conversation.high_user_id].reject { |i| i == current_user.id }.first
  end
end
