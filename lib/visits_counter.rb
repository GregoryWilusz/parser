require 'page_view'

class VisitsCounter
  def initialize(logs)
    @ips_grouped_by_url = group_visits_by_url(logs)
  end

  attr_reader :ips_grouped_by_url

  def page_views
    ips_grouped_by_url.map { |url, ips| PageView.new(url, ips.count) }
  end

  def unique_page_views
    ips_grouped_by_url.map { |url, ips| PageView.new(url, ips.uniq.count) }
  end

  private

  def group_visits_by_url(logs)
    logs
      .sort_by(&:url)
      .chunk { |item| item.url }
      .map { |url, logs| [url, logs.map(&:ip)] }
  end
end
