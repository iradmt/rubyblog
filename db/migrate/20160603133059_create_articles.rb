class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null:false
      t.string :content, null:false
	  t.references :user, index: true, foreign_key: true, null: false
      t.timestamps null: false
    end
  end
end
