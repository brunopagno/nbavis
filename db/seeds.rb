$team_aliases = [
  { a:'ATL', n:'Atlanta Hawks' },
  { a:'BOS', n:'Boston Celtics' },
  { a:'CHI', n:'Chicago Bulls' },
  { a:'CLE', n:'Clevland Cavaliers' },
  { a:'DAL', n:'Dallas Mavericks' },
  { a:'DEN', n:'Denver Nuggets' },
  { a:'DET', n:'Detroit Pistons' },
  { a:'GSW', n:'Golden State Warriors' },
  { a:'HOU', n:'Houston Rockets' },
  { a:'IND', n:'Indiana Pacers' },
  { a:'KCK', n:'Kansas City Kings' },
  { a:'LAL', n:'Los Angeles Lakers' },
  { a:'MIL', n:'Milwalkee Bucks' },
  { a:'NKN', n:'New York Nets' },
  { a:'NYK', n:'New York Knicks' },
  { a:'PHI', n:'Philadelphia 76ers' },
  { a:'PHO', n:'Phoenix Suns' },
  { a:'POR', n:'Portland Trailblazers' },
  { a:'SAS', n:'San Antonio Spurs' },
  { a:'SDC', n:'San Diego Clippers' },
  { a:'SEA', n:'Seatle Supersonics' },
  { a:'UTA', n:'Utah Jazz' },
  { a:'WA1', n:'Washington Bullets' },
  { a:'LAC', n:'Los Angeles Clippers' },
  { a:'SAC', n:'Sacramento Kings' },
  { a:'CHA', n:'Charlotte Hornets' },
  { a:'MIA', n:'Miami Heat' },
  { a:'MIN', n:'Minnesota Timberwolves' },
  { a:'ORL', n:'Orlando Magic' },
  { a:'TOR', n:'Toronto Raptors' },
  { a:'VAN', n:'Vancouver Grizzlies' },
  { a:'WAS', n:'Washington Wizards' },
  { a:'MEM', n:'Memphis Grizzlies' },
  { a:'NOH', n:'New Orleans Hornets' },
  { a:'CHR', n:'Charlotte Bobcats' },
  { a:'NOO', n:'New Orleans Hornets' },
  { a:'OKC', n:'Oklahoma City Thunder' },
  { a:'TOT', n:'[[PLAYER TOTAL]]' },
  { a:'NJN', n:'New Jersey Nets' },
]

def get_team_name(a)
  $team_aliases.each do |ta|
    if ta[:a] == a
      return ta[:n]
    end
  end
end

if Team.all.empty?
  File.readlines('db/basketballdatabase/team_season.csv').each do |line|
    next if line.include?('team,year,leag')
    team_data = line.split(',')

    team = Team.find_by_alias(team_data[0])
    teamname = get_team_name(team_data[0])
    team = Team.create(
      alias: team_data[0],
      name: teamname
    ) unless team

    TeamData.create(
      team:                   team,
      year:                   team_data[1],
      field_goals_made:       team_data[3],
      field_goals_attempted:  team_data[4],
      free_throws_made:       team_data[5],
      free_throws_attempted:  team_data[6],
      offensive_resbounds:    team_data[7],
      defensive_rebounds:     team_data[8],
      rebounds:               team_data[9],
      assists:                team_data[10],
      personal_fouls:         team_data[11],
      steals:                 team_data[12],
      turnovers:              team_data[13],
      blocks:                 team_data[14],
      three_points_made:      team_data[15],
      three_points_attempted: team_data[16],
      points:                 team_data[17],
      won:                    team_data[34],
      lost:                   team_data[35],
    )
  end
end

if Player.all.empty?
  File.readlines('db/basketballdatabase/player_regular_season.csv').each do |line|
    next if line.include?('ilkid')
    player_data = line.split(',')

    player = Player.find_by_ilkid(player_data[0])
    player = Player.create(
      ilkid: player_data[0],
      firstname: player_data[2],
      lastname: player_data[3],
    ) unless player

    team = Team.find_by_alias(player_data[4])
    team = Team.create(
      alias: player_data[4]
    ) unless team

    PlayerData.create(
      player:                 player,
      team:                   team,
      year:                   player_data[1],
      games_played:           player_data[6],
      minutes:                player_data[7],
      points:                 player_data[8],
      offensive_rebounds:     player_data[9],
      defensive_rebounds:     player_data[10],
      rebounds:               player_data[11],
      assists:                player_data[12],
      steals:                 player_data[13],
      blocks:                 player_data[14],
      turnovers:              player_data[15],
      personal_fouls:         player_data[16],
      field_goals_attempted:  player_data[17],
      field_goals_made:       player_data[18],
      free_throws_attempted:  player_data[19],
      free_throws_made:       player_data[20],
      three_points_attempted: player_data[21],
      three_points_made:      player_data[22]
    )
  end
end
