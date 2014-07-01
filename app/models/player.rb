class Player < ActiveRecord::Base
  has_many :player_datas, dependent: :destroy

  validates :ilkid, :firstname, presence: true

  def most_epic
    self.player_datas.sort_by { |pd| -pd.relevance }.first(3)
  end

  def last_player_data
    self.player_datas.order(:year).last
  end

  def scater_data
    return self.player_datas.map { |pd| { ident: pd.id, year: pd.year, relevance: pd.relevance }}
  end
end
