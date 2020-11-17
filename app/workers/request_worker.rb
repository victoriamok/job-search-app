class RequestWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perfom(*args)

  end
end
