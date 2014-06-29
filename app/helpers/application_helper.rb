module ApplicationHelper

  def gon_set_maxs
    gon.max_assists   = PlayerStats.maximum(:assists)
    gon.max_turnovers = PlayerStats.maximum(:turnovers)
    gon.max_blocks    = PlayerStats.maximum(:blocks)
    gon.max_rebounds  = PlayerStats.maximum(:rebounds)
    gon.max_steals    = PlayerStats.maximum(:steals)
    gon.max_points    = PlayerStats.maximum(:points)
  end

  def teams_to_js(teams)
    tt = []
    teams.each do |team|
      team.team_datas.each do |team_data|
        td = { year: team_data.year.to_s, wins: team_data.won, img: team.alias }
        tt << td
      end
    end
    gon.teams = tt
  end

end
