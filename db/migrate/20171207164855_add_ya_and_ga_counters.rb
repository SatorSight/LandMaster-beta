class AddYaAndGaCounters < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :ya_counter, :string
    add_column :pages, :ga_counter, :string
  end
end