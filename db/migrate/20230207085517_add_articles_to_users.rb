class AddArticlesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :articles, :users, foreign_key: true
  end
end
