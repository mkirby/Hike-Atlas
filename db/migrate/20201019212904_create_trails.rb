class CreateTrails < ActiveRecord::Migration[6.0]
  def change
    create_table :trails do |t|
      t.integer :api_id
      t.string :name
      t.string :summary
      t.string :difficulty
      t.float :stars
      t.string :location
      t.string :img_sq_small
      t.string :img_medium
      t.float :length
      t.integer :ascent
      t.integer :high
      t.string :condition_status
      t.string :condition_details
      t.string :condition_date
      t.string :url

      t.timestamps
    end
  end
end
