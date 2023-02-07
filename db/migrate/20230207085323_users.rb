class Users < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :name
      t.text :description
      t.string :password_digest
      t.timestamps
    end
  end
end
