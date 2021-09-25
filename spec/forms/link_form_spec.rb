require 'rails_helper'

describe LinkForm, type: :model do
  it 'validates presence of url attribute' do
    is_expected.to validate_presence_of(:url)
  end

  context 'with format validation' do
    it { is_expected.to allow_value(Faker::Internet.url).for(:url) }
    it { is_expected.not_to allow_value('google.com').for(:url) }
  end
end
