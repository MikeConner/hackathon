namespace :db do
  desc "Geocode data"
  task :geocode => :environment do
    include ApplicationHelper
    
    puts "Geocoding data in property..."
    
    Property.all.each do |property|
      if !property.mappable?
        puts "Coding #{property.parcel_id}"
        sleep 1
        geocode = geocode_address(property.address)
        latitude = geocode.nil? ? nil : geocode['lat']
        longitude = geocode.nil? ? nil : geocode['lng'] 
        
        property.update_attributes!(:latitude => latitude, :longitude => longitude)   
      end 
    end
  end
end
