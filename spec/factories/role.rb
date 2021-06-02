FactoryBot.define do
  factory :role, class: Role do
    code { Faker::Internet.slug }
    name { Faker::Internet.name }
  end
  factory :role_admin, class: Role do
    code { 'admin' }
    name { 'Admin'}
  end

  factory :role_staff, class: Role do
    code { 'staff' }
    name { 'Staff' }
  end

  factory :role_customer, class: Role do
    code { 'customer' }
    name { 'Customer' }
  end
end
