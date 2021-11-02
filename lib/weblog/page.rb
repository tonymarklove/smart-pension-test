class Weblog::Page
  attr_reader :path, :total_visits

  def initialize(path)
    @path = path
    @unique_ips = Set.new
    @total_visits = 0
  end

  def log_visit(ip_address)
    unique_ips << ip_address
    @total_visits += 1
  end

  def unique_visits
    unique_ips.size
  end

  private

  attr_reader :unique_ips
end
