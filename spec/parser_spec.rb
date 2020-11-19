require 'parser'
require 'log_entries_fetcher'
require 'visits_counter'

RSpec.describe Parser do
  subject(:parser) { described_class.new(log_file) }

  let(:log_file) { File.open('spec/fixtures/example_webserver.log') }

  describe '#call' do
    it 'returns page views and unique page views sorted by popularity' do
      expect { parser.call }.to output(
"PAGE VIEWS
/page/1 4 views
/home 2 views
UNIQUE PAGE VIEWS
/page/1 3 views
/home 2 views\n"
      ).to_stdout
    end
  end
end
