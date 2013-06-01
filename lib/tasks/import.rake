require 'csv'

namespace :db do
  desc "Import data"
  task :import => :environment do
    puts "Importing data from property..."
    
    Property.destroy_all
    
    CSV.foreach('/Users/Jeff/Documents/property.csv', :headers => true) do |row|
      
    end
  end
end
