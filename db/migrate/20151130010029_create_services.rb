class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :image
      t.string :category
      t.string :name
      t.string :address
      t.string :phone
      t.string :description
      t.integer :avg_rating

      t.timestamps

    end
  end
end
