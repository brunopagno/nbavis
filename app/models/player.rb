class Player < ActiveRecord::Base
  has_many :player_datas, dependent: :destroy

  validates :ilkid, :firstname, presence: true
end
