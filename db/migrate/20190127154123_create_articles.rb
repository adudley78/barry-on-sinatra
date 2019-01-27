class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.text :content
      t.text :pseudo_score
    end
  end
end
