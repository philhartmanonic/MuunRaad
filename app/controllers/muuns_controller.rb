class MuunsController < ApplicationController
	def index
		@muuns = Muun.all
	end

	def show
		@muun = Muun.find(params[:id])
	end

	def home
		@moon = Muun.moon_for_date(Date.today.strftime('%m/%d/%Y'))
		@muun = Muun.muun_for_date(Date.today.strftime('%m/%d/%Y'))
		@muuns = Muun.all
	end

	def show
		@muun = Muun.find(params[:id])
	end

	def date
		date = "#{params[:month]}/#{params[:day]}/#{params[:year]}"
		@muun = Muun.muun_for_date(date)
		redirect_to action: "show", id: @muun.id
	end
end