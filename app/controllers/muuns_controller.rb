class MuunsController < ApplicationController
	def index
		@muuns = Muun.all
	end

	def show
		@muun = Muun.find(params[:id])
	end

	def home
		@moon = FullMoon.moon_for_date(Date.today)
		@muun = Muun.where(lunar_number: FullMoon.muun_for_date(Date.today)).first
	end

	def date
		@munn = Munn.where(lunar_number: FullMoon.muun_for_date(Date.strptime(params[:date], '%m/%d/%Y'))).first
	end
end