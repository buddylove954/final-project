class GamesController < ApplicationController

	def new
		@games = current_user.games.new
		render(:new)
	end

	def create
		@games = Current_user.games.new games_params
		if @games.save 
			redirect_to new_game_path
		end
	end

	private

	def games_params
		params.require(@games).permit(:username, :game)
	end
end
