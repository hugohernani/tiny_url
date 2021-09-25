require 'rails_helper'

RSpec.describe 'Links', type: :request do
  describe 'POST /create' do
    let(:link_params) do
      {
        link: {
          url: Faker::Internet.url
        }
      }
    end

    it 'returns http success' do
      post '/', params: link_params

      expect(response).to have_http_status(:success)
    end

    it 'creates a Link object in database' do
      expect do
        post '/', params: link_params
      end.to change(Link, :count)
    end
  end

  describe 'GET /show' do
    let(:link){ create(:link) }

    it 'returns http redirection' do
      get "/#{link.short_url}"

      expect(response).to have_http_status(:redirect)
    end
  end
end
