require 'rails_helper'

RSpec.describe 'Links::Statistics', type: :request do
  describe 'GET /show' do
    let(:link){ create(:link) }

    it 'returns http success' do
      get "/#{link.short_url}/info"

      expect(response).to have_http_status(:success)
    end
  end
end
