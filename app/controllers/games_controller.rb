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

	def index
		@games = Game.all
	end

	def show
		@twitch = Twitch.new
		@game_idx = params[:id].to_i
		@streams = @twitch.getStreams({"game"=>$GAME_DROPDOWN[@game_idx][0]})[:body]["streams"]
		@arr = @streams.map do |stream|
			{id: stream["_id"], game: stream["game"],
			link: stream["_links"]["self"].split('/streams/')[1],
			 viewers: stream["viewers"]}
			end	
			puts @arr[0][:game]		 
		@logo = @twitch.searchGames({"q"=>"#{@arr[0][:game]}","type"=>"suggest"})[:body]["games"][0]["logo"]["medium"]
	end

	private

	def games_params
		params.require(:game).permit(:username, :game)
	end
end
