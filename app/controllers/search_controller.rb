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
  
    #Rails.logger.info(@jobs.to_json)
   
    begin
      RequestWorker.perform_async(params[:query])
      puts("CONTROLLER")
      #response = Request.new(params[:query]).call.read_body
      #@jobs = ActiveSupport::JSON.decode(response)
      @jobs = Rails.cache.read("jobs")

    rescue ActiveSupport::JSON.parse_error
      Rails.logger.warn("Attempted to decode invalid JSON: #{response}")
    end
  end
end