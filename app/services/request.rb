class Request

  require 'uri'
  require 'net/http'

  attr_reader :query

  def initialize(query)
    @query = query
  end

  def call
    http.request(request)
  end

  private

  # default location set to Munich
  def url
    URI("https://jobs.github.com/positions.json?&location=munich&description=#{query}")
  end

  def request
    request = Net::HTTP::Get.new(url)
    request["x-github-host"] = 'jobs.github.com/api'
    request["content-type"] = 'application/json'
    request["accept"] = 'application/json'
    request.body
    request
  end

  def http
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http
  end
end