FactoryBot.define do
  factory :link do
    url { Faker::Internet.url }
    short_url { SecureRandom.urlsafe_base64(6) }
  end
end
