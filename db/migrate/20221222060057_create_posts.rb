class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

    
      t.integer :player_id
      t.integer :stadium, null: false, default: 0
      t.string :opponent
      t.text :contents
      t.timestamps
    end
  end
end
