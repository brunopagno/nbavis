class TeamsController < ApplicationController
  include ApplicationHelper

  before_action :teams_js

  def index
    @teams = Team.all
  end

  private

  def teams_js
    teams_to_js(Team.all)
  end

end
