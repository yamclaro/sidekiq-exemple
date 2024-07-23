class SchedulerJobManager
  include Sidekiq::Worker

  def self.perform_async(job_class, *args)
    job_class.perform_async(*args)
  end

  def self.perform_in(job_class, delay_in_seconds, *args)
    job_class.perform_in(delay_in_seconds, *args)
  end

  def self.perform_at(job_class, timestamp, *args)
    job_class.perform_at(timestamp, *args)
  end
end
