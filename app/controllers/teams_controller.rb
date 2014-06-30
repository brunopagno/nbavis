class TeamsController < ApplicationController
  include ApplicationHelper

  before_action :teams_js

  def index
    @teams = Team.all
  end

  def teams
    @teams = Team.all
  end

  def team
    @team = Team.find(params[:id])
  end

  private

  def teams_js
    teams = Team.all
    tt = []
    teams.each do |team|
      team.team_datas.each do |team_data|
        td = { year: team_data.year.to_s, wins: team_data.won, img: team.alias, imgp: ActionController::Base.helpers.image_path('logos/'+team.alias+'.gif') }
        tt << td
      end
    end
    gon.teams = tt
  end

end
