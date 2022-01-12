FactoryBot.define do
  factory :teacher, class: Teacher do
    sequence(:email) { |i| "#{i}name@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
    name { 'name' }
    prefecture { 'prefecture' }
    city { 'city' }
    gender { 1 }
    age { 23 }
  end
end
