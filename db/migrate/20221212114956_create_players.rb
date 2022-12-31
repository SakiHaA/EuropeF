class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|

      t.integer :league_id
      t.integer :team_id
      t.string :player_name
      t.text :player_image
      t.text :player_introduction
      t.timestamps
    end
  end
end
