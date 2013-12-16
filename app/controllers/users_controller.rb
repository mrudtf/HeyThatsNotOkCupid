class UsersController < ApplicationController
  skip_before_filter :require_current_user!, only: [:new, :create]
  before_filter :require_no_current_user!, only: [:new, :create]
  before_filter :require_correct_user!, only: [:edit, :update, :destroy]

  def create
    @user = User.new(params[:user])

    if @user.save
      self.current_user = @user
      redirect_to new_profile_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @responses = Response.find_all_by_user_id(params[:id])
    if @user == current_user
      @unanswered_question = (Question.all - @user.answered_questions).first
    else
      Visit.new(visitor_id: current_user.id, visitee_id: params[:id]).save
    end
  end

  def index
    @users = filter_index
  end

  def my_profile
    redirect_to user_url(current_user)
  end
end
