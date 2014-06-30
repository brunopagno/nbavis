class Player < ActiveRecord::Base
  has_many :player_datas, dependent: :destroy

  validates :ilkid, :firstname, presence: true

  def most_epic
    self.player_datas.sort_by { |pd| -pd.relevance }.first(3)
  end
end
