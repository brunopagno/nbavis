module ApplicationHelper

  def gon_set_maxs
    gon.max_assists   = PlayerData.maximum(:assists)
    gon.max_turnovers = PlayerData.maximum(:turnovers)
    gon.max_blocks    = PlayerData.maximum(:blocks)
    gon.max_rebounds  = PlayerData.maximum(:rebounds)
    gon.max_steals    = PlayerData.maximum(:steals)
    gon.max_points    = PlayerData.maximum(:points)
  end

end
