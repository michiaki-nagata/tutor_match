FactoryBot.define do
  factory :comment do
    message_id { nil } 
    text { 'hello' }
    sender { nil }
  end
end