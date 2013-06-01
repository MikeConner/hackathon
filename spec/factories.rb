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
end