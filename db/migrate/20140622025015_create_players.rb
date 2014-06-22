class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :ilkid
      t.string :firstname
      t.string :lastname

      t.timestamps
    end

    add_index :players, :ilkid, unique: true
  end
end
