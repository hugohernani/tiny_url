require 'rails_helper'

RSpec.describe 'Links', type: :request do
  describe 'POST /create' do
    context 'with valid params' do
      let(:link_params) do
        {
          link: {
            url: Faker::Internet.url
          }
        }
      end

      it 'returns http redirect' do
        post '/', params: link_params

        expect(response).to have_http_status(:redirect)
      end

      it 'creates a Link object in database' do
        expect do
          post '/', params: link_params
        end.to change(Link, :count)
      end
    end

    context 'with invalid params' do
      let(:invalid_link_params) do
        {
          link: {
            url: 'invalid-url.com'
          }
        }
      end

      it 'returns http 422 status' do
        post '/', params: invalid_link_params

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET /show' do
    let(:link){ create(:link) }

    it 'adds visitor into found link object' do
      expect do
        get "/#{link.short_url}"
      end.to change{ link.reload.visitors.count }.by(1)
    end

    it 'saves visitor request ip into Visitor object' do
      mock_ip = '192.0.0.12'
      get "/#{link.short_url}", params: {}, env: { 'REMOTE_ADDR' => mock_ip }

      visitor = Visitor.includes(:link).find_by(links: { short_url: link.short_url })
      expect(visitor.request_ip).to eq mock_ip
    end

    it 'returns http redirection' do
      get "/#{link.short_url}"

      expect(response).to have_http_status(:redirect)
    end
  end
end
