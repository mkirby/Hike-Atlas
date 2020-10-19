class CreateHikes < ActiveRecord::Migration[6.0]
  def change
    create_table :hikes do |t|
      t.belongs_to :trail, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.string :note

      t.timestamps
    end
  end
end
