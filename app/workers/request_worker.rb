class RequestWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  
  def perform(query)
    begin
      response = Request.new(query).call.read_body
      #abort(response)
      jobs = ActiveSupport::JSON.decode(response)
      pp(jobs)
      puts("Worker")
      Rails.cache.write("jobs", jobs)
      #Rails.logger.debug "Here's some info: #{response.inspect}"
     # Rails.logger.info(@jobs.to_json)
    rescue ActiveSupport::JSON.parse_error
      Rails.logger.warn("Attempted to decode invalid JSON: #{response}")
    end
  end
end

# sAdd("jobs:munich:engineer", "serializedJobAd")
#
# sMembers("jobs:munich:engineer") -> "serializedJobAd"
