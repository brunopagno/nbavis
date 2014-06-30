class PlayersController < ApplicationController
  include ApplicationHelper

  before_action :set_maxs, except: :index

  def index
    @players = Player.all
  end

  def player
    @player = Player.find(params[:id])
  end

  def year
    @year = params[:year]
    @player_data = PlayerData.where(year: @year)
    rank = params[:rank]
    if rank
      @player_data.order!(rank => :desc)
    end
  end

  private

  def set_maxs
    gon_set_maxs
  end

end
