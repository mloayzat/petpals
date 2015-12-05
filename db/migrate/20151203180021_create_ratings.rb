class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :service_id
      t.integer :user_id
      t.float :rating

      t.timestamps

    end
  end
end
