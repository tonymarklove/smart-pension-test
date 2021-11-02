class Weblog::Parser
  def initialize(filename)
    if !filename || filename.empty?
      raise Weblog::FileNotFoundError, "No filename provided"
    end

    unless File.exists?(filename)
      raise Weblog::FileNotFoundError, "File not found: #{filename}"
    end

    @pages = parse_logs_from_file(filename)
  end

  def print_total_visits
    puts "total visits"
    puts "------------"

    pages.sort_by(&:total_visits).reverse.each do |page|
      puts "#{page.path.ljust(max_path_length)} #{page.total_visits} visits"
    end

    puts "\n"
  end

  def print_unique_visits
    puts "unique visits"
    puts "-------------"

    pages.sort_by(&:unique_visits).reverse.each do |page|
      puts "#{page.path.ljust(max_path_length)} #{page.unique_visits} unique views"
    end

    puts "\n"
  end

  private

  attr_reader :pages

  def max_path_length
    @max_path_length ||= pages.map { |page| page.path.length }.max
  end

  def parse_logs_from_file(filename)
    lines = File.readlines(filename, chomp: true)
    pages_by_path = lines.each_with_object({}) do |line, memo|
      path, ip = parse_line(line)
      memo[path] ||= Weblog::Page.new(path)
      memo[path].log_visit(ip)
    end
    pages_by_path.values
  end

  def parse_line(line)
    line.split(' ', 2)
  end
end
