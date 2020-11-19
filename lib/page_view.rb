class PageView
  def initialize(url, views)
    @url = url
    @views = views
  end

  attr_reader :url, :views

  def print
    "#{url} #{views} views"
  end
end
