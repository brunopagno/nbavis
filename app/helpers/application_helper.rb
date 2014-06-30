module ApplicationHelper

  def gon_set_maxs
    gon.max_assists   = PlayerStats.maximum(:assists)
    gon.max_turnovers = PlayerStats.maximum(:turnovers)
    gon.max_blocks    = PlayerStats.maximum(:blocks)
    gon.max_rebounds  = PlayerStats.maximum(:rebounds)
    gon.max_steals    = PlayerStats.maximum(:steals)
    gon.max_points    = PlayerStats.maximum(:points)
  end

end
