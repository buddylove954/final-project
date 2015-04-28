class UsersController < ApplicationController
	before_action :authenticate_user!

	def home
		@twitch = Twitch.new
		# @result = @twitch.getStream("CLGDoublelift ")
		# if @result == nil
		# 	@result = @twitch.getFeaturedStreams
	 #    	@id = @result[:body]['stream']['_id']
		# 	@channel = @result[:body]['_links']['channel'].split("channels/")[1]
		# @result = @twitch.getFeaturedStreams
		# @result[:body]["featured"][1]["id"]
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
		@logo = @twitch.searchGames({"q"=>"#{@game[:game]}", "type"=>"suggest"})[:body]["games"][0]["logo"]["medium"]
		@id = @game[:id]
		@views = @game[:viewers]
		@channel = @game[:link]
		render(:home)
	end
end
