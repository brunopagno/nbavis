class PlayerData < ActiveRecord::Base
  belongs_to :player
  belongs_to :team

  def relevance
    unless $points
      $points         = PlayerData.maximum(:points).to_f
      $rebounds       = PlayerData.maximum(:rebounds).to_f
      $assists        = PlayerData.maximum(:assists).to_f
      $steals         = PlayerData.maximum(:steals).to_f
      $blocks         = PlayerData.maximum(:blocks).to_f
      $turnovers      = PlayerData.maximum(:turnovers).to_f
      $personal_fouls = PlayerData.maximum(:personal_fouls).to_f
    end
    relevance = 0
    relevance += self.points.to_f            / $points
    relevance += self.rebounds.to_f          / $rebounds
    relevance += self.assists.to_f           / $assists
    relevance += self.steals.to_f            / $steals
    relevance += self.blocks.to_f            / $blocks
    relevance -= self.turnovers.to_f         / $turnovers
    relevance -= self.personal_fouls.to_f    / $personal_fouls
    relevance += self.field_goals_made.to_f  / self.field_goals_attempted.to_f unless self.field_goals_attempted == 0
    relevance += self.free_throws_made.to_f  / self.free_throws_attempted.to_f unless self.free_throws_attempted == 0
    relevance += self.three_points_made.to_f / self.three_points_attempted.to_f unless self.three_points_attempted == 0
    return relevance
  end

end
