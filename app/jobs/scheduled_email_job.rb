class ScheduledEmailJob
  include Sidekiq::Job
  queue_as :mailers
    def perform(user_id, arraydestinatarios)
      sleep(5)
      puts "teste ok"
    end
end
