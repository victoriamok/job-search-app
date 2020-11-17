class SearchController < ApplicationController
  
  # Available parameters:
  # id
  # type
  # url
  # created_at
  # company
  # company_url
  # location
  # title
  # description
  # how_to_apply
  # company_logo
  
  def new
  end
  
  def index
    # TODO
    # RequestWorker.perform_async(request)
    begin
      response = Request.new(params[:query]).call.read_body
      @results = ActiveSupport::JSON.decode(response)
    rescue ActiveSupport::JSON.parse_error
      Rails.logger.warn("Attempted to decode invalid JSON: #{response}")
    end
  end
end