class Game < ActiveRecord::Base
	has_and_belongs_to_many :users

	validates :games, uniqueness: true
end
