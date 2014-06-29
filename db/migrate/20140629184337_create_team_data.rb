class CreateTeamData < ActiveRecord::Migration
  def change
    create_table :team_data do |t|
      t.references :team, index: true
      t.integer :year
      t.integer :field_goals_made
      t.integer :field_goals_attempted
      t.integer :free_throws_made
      t.integer :free_throws_attempted
      t.integer :offensive_resbounds
      t.integer :defensive_rebounds
      t.integer :rebounds
      t.integer :assists
      t.integer :personal_fouls
      t.integer :steals
      t.integer :turnovers
      t.integer :blocks
      t.integer :three_points_made
      t.integer :three_points_attempted
      t.integer :points
      t.integer :won
      t.integer :lost

      t.timestamps
    end
  end
end
