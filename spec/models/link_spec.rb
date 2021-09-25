require 'rails_helper'

RSpec.describe Link, type: :model do
  describe '#shorten' do
    let(:incoming_url){ Faker::Internet.url }

    it 'creates a link with a short url when given a complete url' do
      link = Link.shorten(url: incoming_url)
      expect(link.short_url).not_to be nil
    end
  end

  describe '#increase_visit' do
    let(:link){ create(:link) }
    let(:request_ip){ '192.168.0.1' }

    it 'adds a visit info object association into found Link object' do
      expect do
        Link.increase_visit(short_url: link.short_url, request_ip: request_ip)
      end.to change{ link.reload.visitors.count }.by(1)
    end

    it 'increase visits when visitor already exist' do
      visitor = create(:visitor, link: link, request_ip: request_ip)

      expect do
        Link.increase_visit(short_url: link.short_url, request_ip: request_ip)
      end.to change{ visitor.reload.visits }.by(1)
    end

    it 'raises an NotFound error when none Link object is found' do
      expect do
        Link.increase_visit(short_url: 'unknown', request_ip: '192.168.0.1')
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
