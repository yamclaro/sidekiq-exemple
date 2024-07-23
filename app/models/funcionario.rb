class Funcionario < ApplicationRecord
  belongs_to :user
  before_create :set_email_job

  def set_email_job
    SchedulerJobManager.perform_async(ScheduledEmailJob, 1)

    SchedulerJobManager.perform_in(ScheduledEmailJob, 10.minutes.from_now, 1)

    SchedulerJobManager.perform_at(ScheduledEmailJob, Time.now + 1.day, 1)
  end
end
