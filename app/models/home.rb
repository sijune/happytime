class Home < ActiveRecord::Base
    
    belongs_to :user
    
    def self.with_lat_nearest_to(lat)
    Post.order("abs(lat - #{lat})")
    end
    
end
