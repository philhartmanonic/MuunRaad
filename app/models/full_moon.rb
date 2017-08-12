class FullMoon < ApplicationRecord
	def FullMoon.moon_for_date(query_date)
		FullMoon.where('moon_date >= ? and moon_date <= ?', query_date - 45, query_date).sort_by { |moon| moon.moon_date }[-1]
	end

	def FullMoon.muun_for_date(query_date)
		query_full_moon = FullMoon.moon_for_date(query_date)
		if query_full_moon.moon_date < Date.strptime("03/21/#{query_full_moon.moon_date.year}", '%m/%d/%Y')
			FullMoon.where('moon_date >= ? and moon_date < ?', Date.strptime("03/21/#{(query_full_moon.moon_date - 365).year}", '%m/%d/%Y'), Date.strptime("03/21/#{query_full_moon.moon_date.year}", '%m/%d/%Y')).sort_by{ |moon| moon.moon_date }.index(query_full_moon)
		else
			FullMoon.where('moon_date >= ? and moon_date < ?', Date.strptime("03/21/#{query_full_moon.moon_date.year}", '%m/%d/%Y'), Date.strptime("03/21/#{(query_full_moon.moon_date + 364).year}", '%m/%d/%Y')).sort_by{ |moon| moon.moon_date }.index(query_full_moon)
		end
	end

	def number
		if self.moon_date < Date.strptime("03/21/#{self.moon_date.year}", '%m/%d/%Y')
			FullMoon.where('moon_date >= ? and moon_date < ?', Date.strptime("03/21/#{(query_full_moon.moon_date - 365).year}", '%m/%d/%Y'), Date.strptime("03/21/#{query_full_moon.moon_date.year}", '%m/%d/%Y')).sort_by{ |moon| moon.moon_date }.index(query_full_moon)
		else
			FullMoon.where('moon_date >= ? and moon_date < ?', Date.strptime("03/21/#{query_full_moon.moon_date.year}", '%m/%d/%Y'), Date.strptime("03/21/#{(query_full_moon.moon_date + 364).year}", '%m/%d/%Y')).sort_by{ |moon| moon.moon_date }.index(query_full_moon)
		end
	end
end
