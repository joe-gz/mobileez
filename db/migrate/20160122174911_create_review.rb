class CreateReview < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :comment
      t.integer :score
      t.string :location_id
    end
  end
end
