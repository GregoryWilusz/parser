require_relative './log_entries_fetcher'
require_relative './visits_counter'

class Parser
  def initialize(log_file)
    @log_entries = LogEntriesFetcher.new.call(log_file)
    @visits_counter = VisitsCounter.new(@log_entries)
  end

  def call
    print_header('PAGE VIEWS')
    print_page_views_ordered_by_popularity
    print_separator
    print_header('UNIQUE PAGE VIEWS')
    print_unique_page_views_ordered_by_popularity
  end

  private

  attr_reader :visits_counter

  def print_header(content)
    puts content
    print_separator
  end

  def print_page_views_ordered_by_popularity
    puts sort(visits_counter.page_views).map(&:print)
  end

  def print_separator
    puts
  end

  def print_unique_page_views_ordered_by_popularity
    puts sort(visits_counter.unique_page_views).map(&:print)
  end

  def sort(page_views)
    page_views.sort_by(&:views).reverse!
  end
end
