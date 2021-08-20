class CreateSmtpServerSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :smtp_server_settings do |t|
      t.string :uid
      t.string :host
      t.string :user_name
      t.string :user_password
      t.string :domain
      t.string :address
      t.integer :port
      t.string :authentification
      t.boolean :enable_starttls_auto
      t.boolean :ssl
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
