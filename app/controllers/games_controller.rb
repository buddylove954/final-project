class GamesController < ApplicationController

	def new
		@games = current_user.games.new
		render(:new)
	end

	def create
		@games = current_user.games.new games_params
		@games.user_id = current_user.id
		if @games.save 
			redirect_to new_game_path
		end
	end

	private

	def games_params
		params.require(:game).permit(:username, :game)
	end
end
