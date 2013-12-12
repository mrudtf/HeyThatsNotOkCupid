module UsersHelper
  def my_page?
    current_user == @user
  end
end
