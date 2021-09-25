require 'rails_helper'

describe LinkPresenter do
  subject(:presenter){ described_class.new(link: link) }

  let(:link){ create(:link) }

  describe '#info_header' do
    it 'gives link url' do
      expect(presenter.info_header).to match('')
    end
  end
end

class MockedViewContext
  include Rails.application.routes.url_helpers
end
