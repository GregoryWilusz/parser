require 'page_view'

RSpec.describe PageView do
  subject(:page_view) { described_class.new(url, views) }
  let(:url) { '/home' }
  let(:views) { 222 }

  describe '#print' do
    it 'prints object\'s properties in specific manner' do
      expect(page_view.print).to eq("#{url} #{views} views")
    end
  end
end
