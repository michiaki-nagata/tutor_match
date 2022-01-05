FactoryBot.define do
  factory :teacher do
    sequence(:email) { |i| "name#{i}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
    name { 'name' }
    prefecture { 'prefecture' }
    city { 'city' }
    gender { 1 }
    age { 23 }
  end
end
