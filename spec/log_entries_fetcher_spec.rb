require 'log_entries_fetcher'

RSpec.describe LogEntriesFetcher do
  subject(:log_entries_fetcher) { described_class.new }

  let(:log_file) { File.open('spec/fixtures/example_webserver.log') }

  describe '#call' do
    it 'fetches log entries from a file and returns them as Log objects' do
      expect(log_entries_fetcher.call(log_file)).to match_array [
        match_log('/home', '111.222.333'),
        match_log('/page/1', '123.123.123'),
        match_log('/home', '123.123.123'),
        match_log('/page/1', '123.123.123')
      ]
    end
  end

  def match_log(url, ip)
    have_attributes(
      url: url,
      ip: ip
    )
  end
end
