class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :uid
      t.string :profile_type
      t.string :company_name
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.text :describe
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
