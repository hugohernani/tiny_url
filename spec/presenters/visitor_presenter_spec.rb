require 'rails_helper'

describe VisitorPresenter do
  subject(:presenter){ described_class.new(visitor: visitor) }

  let(:visitor){ create(:visitor) }

  describe '#column_row' do
    it 'returns a html table row content' do
      expected_output = "<tr><td>#{visitor.request_ip}</td><td>#{visitor.visits}</td></tr>"
      expect(presenter.column_row).to match(expected_output)
    end
  end
end
