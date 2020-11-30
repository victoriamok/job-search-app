class Request

  require 'uri'
  require 'net/http'
  require 'json'

  attr_reader :query, :payload

  def initialize(query)
    @query = query
  end

  # sends an http request to the API
  def call
    http.request(request)
  end

  private

  # creates an URI for the API endpoint
  # default location set to Munich
  def url
    URI("https://jobs.github.com/positions.json?location=munich&search=#{query}")
  end

  # builds the request payload
  def request
    request = Net::HTTP::Get.new(url, {'Content-Type' => 'application/json'})
    request["x-github-host"] = 'jobs.github.com/api'
    request.body = payload
    request
  end

  # creates an http request object
  def http
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = (url.scheme == 'https')
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http
  end
end