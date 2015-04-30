class AddGameAndUsernameToGame < ActiveRecord::Migration
  def change
  	add_column :games, :game, :string
  	add_column :games, :username, :string
  end
end
