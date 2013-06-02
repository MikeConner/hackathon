require 'csv'

namespace :db do
  desc "Import data"
  task :import => :environment do
    include ApplicationHelper
    
    puts "Importing data from property..."
    
    Property.destroy_all
    #VACANTID,Owner_ACAD,Land Value,Building Value,Vacant ,TaxCode,TaxDesc,LotArea,Location
    
    CSV.foreach('/Users/Jeff/Documents/LotopiaData.csv', :headers => true) do |row|
      puts "Coding #{row['VACANTID']}"
      if Property.find_by_parcel_id(row['VACANTID']).nil?
        latitude = nil
        longitude = nil
        tax = row['TaxDesc'] =~ /.*- (.*)/ ? $1 : nil
=begin
        sleep 1
        geocode = geocode_address(row['Location'])
        latitude = geocode.nil? ? nil : geocode['lat']
        longitude = geocode.nil? ? nil : geocode['lng']
=end        
        Property.create!(:parcel_id => row['VACANTID'], :owner => row['Owner_ACAD'], :land_value => row['Land Value'],
                         :building_value => row['Building Value'], :vacant => true, :address => row['Location'],
                         :tax_category => tax, :latitude => latitude, :longitude => longitude)
      end
    end
  end
end
