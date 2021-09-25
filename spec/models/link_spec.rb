require 'rails_helper'

RSpec.describe Link, type: :model do
  describe '#shorten' do
    let(:incoming_url){ Faker::Internet.url }

    it 'creates a link with a short url when given a complete url' do
      link = Link.shorten(url: incoming_url)
      expect(link.short_url).not_to be nil
    end
  end
end
