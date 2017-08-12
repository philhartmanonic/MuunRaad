class CreateMuuns < ActiveRecord::Migration[5.1]
  def change
    create_table :muuns do |t|
      t.integer :lunar_number
      t.string :german_name
      t.string :english_name
      t.string :personal_description
      t.string :lunar_description
      t.string :picture_url
      t.timestamps
    end
  end
end
