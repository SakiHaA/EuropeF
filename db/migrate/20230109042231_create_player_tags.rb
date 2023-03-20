class CreatePlayerTags < ActiveRecord::Migration[6.1]
  def change
    create_table :player_tags do |t|
      t.integer :player_id, null: false, foreign_key: true
      t.integer :tag_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
