class AddSkillandTopGamesToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :skill, :integer
  	add_column :users, :topgame, :string
  	add_column :users, :profile_pic, :string
  end
end
