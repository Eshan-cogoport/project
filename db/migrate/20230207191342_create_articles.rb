class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.belongs_to :category, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.string :title
      t.string :description
      t.text :text
      t.string :cover_url
      t.string :author
      t.timestamps
    end
  end
end
