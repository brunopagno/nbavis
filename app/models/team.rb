class Team < ActiveRecord::Base
  has_many :team_datas, dependent: :destroy
  has_many :player_datas

  validates :alias, presence: true

  def players(year=nil)
    if year
      pids = self.player_datas.where(year: year).map(&:player_id).uniq
    else
      pids = self.player_datas.map(&:player_id).uniq
    end
    return Player.find(pids)
  end

  def most_epic_players
    return self.player_datas.sort_by { |pd| -pd.relevance }.first(5)
  end
end
