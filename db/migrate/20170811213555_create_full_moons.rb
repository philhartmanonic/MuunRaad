class CreateFullMoons < ActiveRecord::Migration[5.1]
  def change
    create_table :full_moons do |t|
      t.date :moon_date
      t.timestamps
    end
  end
end
