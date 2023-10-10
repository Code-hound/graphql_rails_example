FactoryBot.define do
  factory :author do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    year_of_birth { Faker::Date.between(60.years.ago, 8.years.ago).year }
    alive { [true, false].sample }
  end
end
