module ProfilesHelper
  def looking_for
    profile = current_user.profile

    if profile.orientation == "Bisexual"
      "everyone"
    elsif profile.orientation == "Straight"
      profile.gender == "M" ? "women" : "men"
    else
      profile.gender == "F" ? "women" : "men"
    end
  end
end