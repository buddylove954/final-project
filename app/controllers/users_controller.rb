class UsersController < ApplicationController
	before_action :authenticate_user!

	def home
		@twitch = Twitch.new
		@streams = @twitch.getStreams[:body]["streams"]
		@arr = @streams.map do |stream|
			if stream["game"] == "League of Legends" && (stream["_id"] != nil && stream["_links"]["self"] != nil)
			{id: stream["_id"], game: stream["game"],
			link: stream["_links"]["self"].split('/streams/')[1],
			 viewers: stream["viewers"]}
			end
		end
		@arr = @arr.delete_if {|array| array == nil}
		@game = @arr.sample
		@logo = @twitch.searchGames({"q"=>"#{@game[:game]}",
		 "type"=>"suggest"})[:body]["games"][0]["logo"]["medium"]
		@users = User.all
		render(:home)
	end
end
