class Team < ActiveRecord::Base
  has_many :player_stats

  validates :alias, presence: true
end
