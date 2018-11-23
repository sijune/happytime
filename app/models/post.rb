class Post < ActiveRecord::Base
    belongs_to :user
    
    def self.with_lat_nearest_to(lat, lng)
    order("abs(lat - #{lat})","abs(lat - #{lng})")
    end
    
     #def self.with_lng_nearest_to(lat)
     #order("abs(lat - #{lat})")
     #end
    
    
    
end
