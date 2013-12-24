class VisitsController < ApplicationController
  def index
    @users = recent_visitors
  end
end
