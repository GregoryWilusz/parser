require 'log'

class LogEntriesFetcher
  def call(log_file)
    file_data = File.open(log_file)
    log_entries(file_data)
  end

  private

  def log_entries(file_data)
    file_data.map do |log_entry|
      url, ip = log_entry.split
      Log.new(url, ip)
    end
  end
end