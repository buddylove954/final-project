class CreateUsersGamesJoin < ActiveRecord::Migration
  def change
    create_table 'games_users', :id => false do |t|
    	t.column 'user_id', :integer
    	t.column 'game_id', :integer
    end
  end
end
