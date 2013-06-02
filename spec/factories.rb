FactoryGirl.define do
  # There is some danger in using random data in tests -- random values are not repeatable, so data-dependent bugs might show up intermittently
  #   On the other hand, using fixed data would never find those bugs at all.
  # For the moment, I'm using random data for tests, but also have "regular" sequences available should they become necessary
  #
  # Random sequences
  sequence(:random_phrase) { |n| Faker::Company.catch_phrase }
  sequence(:random_sentences) { |n| Faker::Lorem.sentences.join(' ') }
  sequence(:random_paragraphs) { |n| Faker::Lorem.paragraphs.join("\n") }
  sequence(:random_name) { |n| Faker::Name.name }
  sequence(:random_street) { |n| Faker::Address.street_address }
  sequence(:random_ip) { |n| sprintf("%d.%d.%d.%d", Random.rand(256), Random.rand(256), Random.rand(256), Random.rand(256)) }
  sequence(:random_category) { |n| Suggestion::CATEGORIES.sample }
  
  factory :property do
    parcel_id { sprintf("%04d%c%04d%04d%03d", Random.rand(10), Random.rand(26) + 65, Random.rand(10000), Random.rand(10000), Random.rand(1000)) }
    address { generate(:random_street) }
    land_value { Random.rand(100000) + 10000 } 
    building_value { Random.rand(50000) + 5000 }
    owner { generate(:random_name) }
    vacant false
    taxes { Random.rand(10000) + 1000 }
    tax_category 'Taxable'
    lot_area { Random.rand(10000) + 1000 }
    
    factory :vacant_property do
      vacant true
    end
    
    factory :geocoded_property do
      latitude -40.342342
      longitude 80.2342
    end
  end
  
  factory :suggestion do
    property 
    
    category { generate(:random_category) }
    description { generate(:random_sentences) }
    user_identifier { generate(:random_ip) }
          
    factory :suggestion_with_likes do
      ignore do
        num_likes 2
      end

      after(:create) do |suggestion, evaluator|
        FactoryGirl.create_list(:like, evaluator.num_likes, :suggestion => suggestion)
      end
    end 
  end
  
  factory :like do
    suggestion
    
    user_identifier { generate(:random_ip) }
    comment { generate(:random_paragraphs) }
  end
  
  factory :burden do
    property
    
    user_identifier { generate(:random_ip) }
  end
end