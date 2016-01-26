class AddScoreColumnsToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :entrance_score, :integer
    add_column :reviews, :table_score, :integer
    add_column :reviews, :bathroom_score, :integer
    add_column :reviews, :parking_score, :integer
  end
end
