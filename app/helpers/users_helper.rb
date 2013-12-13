module UsersHelper
  def my_page?
    current_user == @user
  end

  def looking_for
    if current_user.orientation == "Bisexual"
      "everyone"
    elsif current_user.orientation == "Straight"
      current_user.gender == "M" ? "women" : "men"
    else
      current_user.gender == "F" ? "women" : "men"
    end
  end

  def filter_index
    if current_user.orientation == "Straight"
      current_user.gender == "M" ? search_gen = "F" : search_gen = "M"
      people = User.where(gender: search_gen, orientation: ["Straight",
         "Bisexual"])
    elsif current_user.orientation == "Gay"
      current_user.gender == "F" ? search_gen = "F" : search_gen = "M"
      people = User.where(gender: search_gen, orientation: ["Gay", "Bisexual"])
    elsif current_user.orientation == "Bisexual"
      current_user.gender == "M" ? search_gens = ["M","F"] : search_gens =
       ["F","M"]
      people = User.where(gender: search_gens[0], orientation: ["Gay",
       "Bisexual"]) + User.where(gender: search_gens[1], orientation:
       ["Straight", "Bisexual"])
    end

    people - [current_user]
  end
end
