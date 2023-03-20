class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players, id: :integer do |t|

      t.integer :league_id
      t.integer :team_id
      t.string :player_name
      t.text :player_image
      t.string :player_nationality
      t.string :player_age
      t.string :player_height
      t.string :player_weight
      t.string :player_introduction
      t.timestamps
    end
  end
end
