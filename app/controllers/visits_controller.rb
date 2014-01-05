class VisitsController < ApplicationController
  def index
    @visits = recent_visits
  end
end
