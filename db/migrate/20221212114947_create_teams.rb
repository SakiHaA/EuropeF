class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|

      t.integer :league_id
      t.string :team_name
      t.text :team_image
      t.timestamps
    end
  end
end
