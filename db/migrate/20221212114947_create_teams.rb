class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|

      t.integer :league_id
      t.string :name, null: false
      t.text :team_image, null: false
      t.text :introduction, null: false
      t.timestamps
    end
  end
end
