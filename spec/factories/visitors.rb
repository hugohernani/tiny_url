FactoryBot.define do
  factory :visitor do
    link
    request_ip { Faker::Internet.ip_v4_address }
    visits { 1 }
  end
end
