FactoryBot.define do
  factory :hospital, class: Hospital do
    name { Faker::Company.name }
    address { Faker::Address.full_address }
    phone_number { Faker::PhoneNumber.phone_number }
  end

  factory :placement, class: Placement do
    hospital { create(:hospital) }
    doctor { create(:doctor) }
  end
end
