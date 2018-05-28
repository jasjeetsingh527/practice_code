class ClientType < ActiveRecord::Migration[5.1]
  def change
  	add_column :clients, :UserType, :integer
  end
end
