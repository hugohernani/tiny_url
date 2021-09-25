require 'rails_helper'

describe LinksHelper do
  describe '#decorate_visitors' do
    let(:link){ create(:link) }
    let(:visitors){ create_list(:visitor, 1, link: link) }

    it 'returns collection of given object with given presenter_klass' do
      presenters_collection = helper.decorate_visitors(visitors)
      expect(presenters_collection).to include(be_a(VisitorPresenter))
    end
  end
end
