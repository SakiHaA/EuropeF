class CreateLeagues < ActiveRecord::Migration[6.1]
  def change
    create_table :leagues do |t|

      t.string :league_name
      t.text :league_image
      t.timestamps
    end
  end
end
