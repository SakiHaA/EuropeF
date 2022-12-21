class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|

      t.integer :league_id
      t.integer :team_id
      t.string :name, null: false
      t.text :player_image, null: false
      t.text :introduction, null: false
      t.timestamps
    end
  end
end
