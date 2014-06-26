class PlayersController < ApplicationController
  include ApplicationHelper

  def index
    @players = Player.all
  end

  def year
    @year = params[:year]
    @stats = PlayerStats.where(year: @year).limit(4)
    rank = params[:rank]
    if rank
      @stats.order!(rank => :desc)
    end
    gon_set_maxs
  end

end
