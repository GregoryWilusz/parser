require 'log'
require 'visits_counter'

RSpec.describe VisitsCounter do
  subject(:visits_counter) { described_class.new(logs) }

  let(:logs) do
    [
      Log.new('/home', '111.222.333'),
      Log.new('/page/1', '123.123.123'),
      Log.new('/home', '123.123.123'),
      Log.new('/page/2', '123.123.123'),
      Log.new('/home', '123.123.123'),
      Log.new('/page/1', '123.123.123')
    ]
  end

  describe '#page_views' do
    it 'returns PageView objects with counted visits per url' do
      expect(visits_counter.page_views).to match_array [
         match_page_view('/home', 3),
         match_page_view('/page/1', 2),
         match_page_view('/page/2', 1)
      ]
    end
  end

  describe '#unique_page_views' do
    it 'returns PageView objects with counted visits per url' do
      expect(visits_counter.unique_page_views).to match_array [
         match_page_view('/home', 2),
         match_page_view('/page/1', 1),
         match_page_view('/page/2', 1)
     ]
    end
  end

  def match_page_view(url, views)
    have_attributes(
      url: url,
      views: views
    )
  end
end
