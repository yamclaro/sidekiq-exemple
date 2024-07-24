class SchedulerJobManager
  include Sidekiq::Worker

  def self.perform_async(job_class, args = {})
    job_class.perform_async(args.transform_keys(&:to_s))
  end

  def self.perform_in(job_class, delay_in_seconds, args = {})
    job_class.perform_in(delay_in_seconds, args.transform_keys(&:to_s))
  end

  def self.perform_at(job_class, timestamp, args = {})
    job_class.perform_at(timestamp, args.transform_keys(&:to_s))
  end

  # def self.perform_async(job_class, args = {})
  #   job_class.perform_async(*args.values)
  # end

  # def self.perform_in(job_class, delay_in_seconds, args = {})
  #   job_class.perform_in(delay_in_seconds, *args.values)
  # end

  # def self.perform_at(job_class, timestamp, args = {})
  #   job_class.perform_at(timestamp, *args.values)
  # end
end
