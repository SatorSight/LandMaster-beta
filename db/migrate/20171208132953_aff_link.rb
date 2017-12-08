class AffLink < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :link, :string
  end
end
