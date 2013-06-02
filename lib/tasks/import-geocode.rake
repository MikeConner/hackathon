namespace :db do
  desc "Import Geocode data"
  task :import_geocode => :environment do
    include ApplicationHelper
    
    puts "Importing Geocoding data in property..."

    File.open('/Users/jeff/Documents/gps-out2.txt', 'r') do |f|
      while (line = f.gets)
        fields = line.split(',')
        idx = fields[0].to_i
        if idx != 0
          p = Property.find(idx)
          if !p.nil?
            p.update_attributes!(:latitude => fields[1], :longitude => fields[2])
          end
        end
      end
    end    
  end
end
