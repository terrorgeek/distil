class AccountWorker
  include Sidekiq::Worker
  sidekiq_options queue: "high"
  
  def perform
    
  end
end