class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.string :uid
      t.string :slug
      t.string :title
      t.text :content
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
