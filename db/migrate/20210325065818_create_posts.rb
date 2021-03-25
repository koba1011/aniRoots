class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title,    null: false
      t.text :describe,   null: false
      t.text :favorite_scene
      t.string :favorite_character
      t.integer :spoiler
      t.references :user, foreign: true
      t.timestamps
    end
  end
end
