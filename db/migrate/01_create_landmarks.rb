class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.integer :figure_id
      t.integer :year_completed
      t.timestamps null: false
    end
  end
end
