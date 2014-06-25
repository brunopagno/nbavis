class Player < ActiveRecord::Base
  has_many :player_stats

  validates :ilkid, :firstname, presence: true
end
