FactoryBot.define do
  factory :doctor, class: Doctor do
    code { Faker::Code.asin }
    name { Faker::NationalHealthService.name }
    specialty { create(:specialty) }
  end
end
