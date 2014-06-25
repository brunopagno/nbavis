class Team < ActiveRecord::Base
  has_many :player_stats

  validates :name, presence: true
end
