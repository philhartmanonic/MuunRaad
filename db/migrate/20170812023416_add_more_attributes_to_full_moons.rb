class AddMoreAttributesToFullMoons < ActiveRecord::Migration[5.1]
  def change
  	add_column :full_moons, :full_moon_date, :date
  	add_column :full_moons, :last_date, :date
  end
end
