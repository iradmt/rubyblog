class AddDescriptionToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :description, :string, null: false
  end
end
