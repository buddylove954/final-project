class UsersController < ApplicationController
	before_action :authenticate_user!

	def home
		@twitch = Twitch.new
	    @result = @twitch.getStream("dendi")
	    @id = @result[:body]['stream']['_id']

	    @channel = @result[:body]['_links']['channel'].split("channels/")[1]
		render(:home)
	end
end
