class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :username
      t.string :access_token

      t.timestamps
    end
    add_index :clients, :access_token, unique: true
  end
end
