class UsersController < ApplicationController
	before_action :authenticate_user!

	def home
		@twitch = Twitch.new
		@streams = @twitch.getStreams({"game"=>current_user.topgame})[:body]["streams"]
		@arr = @streams.map do |stream|
			if stream["game"] == current_user.topgame && (stream["_id"] != nil && stream["_links"]["self"] != nil)
			{id: stream["_id"], game: stream["game"],
			link: stream["_links"]["self"].split('/streams/')[1],
			 viewers: stream["viewers"]}
			end
				
		end
		@games = Game.where(user_id: current_user.id)
		@games = @games.sample(2)
		@arr = @arr.delete_if {|array| array == nil}
		puts @arr
		puts current_user.topgame
		@game = @arr.sample
		@logo = @twitch.searchGames({"q"=>"#{@game[:game]}","type"=>"suggest"})[:body]["games"][0]["logo"]["medium"] 
		@users = User.all
		render(:home)
		# @game = @twitch.getStreams("game"=>current_user.topgame)[:body]
		# render json: @game
	end

	def index
		@users = User.all
		render(:index)
	end

	def show
		@user = User.find(params[:id])
		@twitch = Twitch.new
		@streams = @twitch.getStreams({"game"=>@user.topgame})[:body]["streams"]
		@arr = @streams.map do |stream|
			if stream["game"] == @user.topgame && (stream["_id"] != nil && stream["_links"]["self"] != nil)
			{id: stream["_id"], game: stream["game"],
			link: stream["_links"]["self"].split('/streams/')[1],
			 viewers: stream["viewers"]}
			end
				
		end
		@games = Game.where(user_id: @user.id)
		@games = @games.sample(2)
		@arr = @arr.delete_if {|array| array == nil}
		puts @arr
		puts @user.topgame
		@game = @arr.sample
		@logo = @twitch.searchGames({"q"=>"#{@game[:game]}","type"=>"suggest"})[:body]["games"][0]["logo"]["medium"] 
		@users = User.all.sample(40)
		render(:show)
	end
end
