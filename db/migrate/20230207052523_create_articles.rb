class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.belongs_to :category
      t.string :title
      t.text :text
      t.string :author
      t.string name
      t.timestamps
    end
  end
end
