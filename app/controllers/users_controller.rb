class UsersController < ApplicationController
	before_action :authenticate_user!

	def home
		@twitch = Twitch.new
	    @result = @twitch.getStream("itshafu")
	    @response = @result[:body]['_links']['channel']
		render(:home)
	end
end
