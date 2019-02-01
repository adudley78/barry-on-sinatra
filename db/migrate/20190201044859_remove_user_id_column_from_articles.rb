class RemoveUserIdColumnFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :user_id, :string
  end
end
