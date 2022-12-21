class CreateLeagues < ActiveRecord::Migration[6.1]
  def change
    create_table :leagues do |t|

      t.string :name, null: false
      t.text :league_image
      t.text :introduction, null: false
      t.timestamps
    end
  end
end
