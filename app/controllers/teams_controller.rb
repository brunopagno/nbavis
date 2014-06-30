class TeamsController < ApplicationController
  include ApplicationHelper

  before_action :teams_js

  def index
    @teams = Team.all
  end

  def teams
    @teams = Team.all
    gon_set_maxs
  end

  def team
    @team = Team.find(params[:id])
    gon_set_maxs
  end

  private

  def teams_js
    teams = Team.all
    tt = []
    teams.each do |team|
      team.team_datas.each do |team_data|
        td = { year: team_data.year.to_s, wins: team_data.won, name: team_data.team.name, img: team.alias, imgp: ActionController::Base.helpers.image_path('logos/'+team.alias+'.gif') }
        tt << td
      end
    end
    gon.teams = tt
  end

end
