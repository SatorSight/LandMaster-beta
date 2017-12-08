class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :title
      t.float :start
      t.boolean :free
      t.string :url
      t.string :button_text
      t.string :button_color
      t.integer :store
      t.string :img_left
      t.string :img_right
      t.string :img_bottom

      t.timestamps
    end
  end
end