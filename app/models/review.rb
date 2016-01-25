class Review < ActiveRecord::Base
belongs_to :user
ratyrate_rateable "table_score", "bathroom_score", "entrance_score", "parking_score"
end
