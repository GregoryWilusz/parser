class PageView
  def initialize(url, views)
    @url = url
    @views = views
  end

  attr_reader :url, :views
end
