class Muun < ApplicationRecord
	require 'pry'
	def Muun.moon_for_date(date)
		date_object = Date.strptime(date, '%m/%d/%Y')
		moon_data = HTTParty.get("http://api.usno.navy.mil/moon/phase?date=#{(date_object - 30).strftime('%m/%d/%Y')}&nump=4")
		new_moon_date = Date.parse(moon_data['phasedata'].select{ |x| x['phase'] == 'New Moon' }[0]['date'])
		years = []
		if new_moon_date >= Date.strptime("03/21/#{date_object.year}", '%m/%d/%Y')
			years = [date_object.year, date_object.year + 1]
		else
			years = [date_object.year - 1, date_object.year]
		end
		begin
			lunar_year_new_moons = (HTTParty.get("http://api.usno.navy.mil/moon/phase?year=#{years[0]}")['phasedata'].select{ |x| x['phase'] == 'New Moon' and Date.parse(x['date']) >= Date.strptime("03/21/#{years[0]}", '%m/%d/%Y') } + HTTParty.get("http://api.usno.navy.mil/moon/phase?year=#{years[1]}")['phasedata'].select{ |x| x['phase'] == 'New Moon' and Date.parse(x['date']) < Date.strptime("03/21/#{years[1]}", '%m/%d/%Y') }).map{ |x| Date.parse(x['date']) }.sort
		rescue
			binding.pry
		end
		{:moon_number => lunar_year_new_moons.index(new_moon_date) + 1, :moon_date => new_moon_date}
	end

	def Muun.muun_for_date(date)
		moon_data = Muun.moon_for_date(date)
		Muun.where(lunar_number: moon_data[:moon_number]).first
	end
end
