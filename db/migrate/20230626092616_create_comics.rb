class CreateComics < ActiveRecord::Migration[5.2]
  def change
    create_table :comics do |t|
      t.text :title
      t.text :story
      t.text :review
      t.text :link
      t.integer :user_id

      t.timestamps
    end
  end
end
