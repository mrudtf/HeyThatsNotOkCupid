class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_current_user!



  include SessionsHelper
  include UsersHelper
  include ProfilesHelper
  include ResponsesHelper
  include VisitsHelper
end
