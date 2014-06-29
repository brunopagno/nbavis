class CreatePlayerData < ActiveRecord::Migration
  def change
    create_table :player_data do |t|
      t.references :player, index: true
      t.references :team, index: true
      t.integer :year
      t.integer :games_played
      t.integer :minutes
      t.integer :points
      t.integer :offensive_rebounds
      t.integer :defensive_rebounds
      t.integer :rebounds
      t.integer :assists
      t.integer :steals
      t.integer :blocks
      t.integer :turnovers
      t.integer :personal_fouls
      t.integer :field_goals_attempted
      t.integer :field_goals_made
      t.integer :free_throws_attempted
      t.integer :free_throws_made
      t.integer :three_points_attempted
      t.integer :three_points_made

      t.timestamps
    end
  end
end
