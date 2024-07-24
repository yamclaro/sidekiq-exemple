class Funcionario < ApplicationRecord
  belongs_to :user
  before_create :set_email_job

  def set_email_job
    args = {
      "manager_email" => "manager@example.com",
      "cc_emails" => ["cc1@example.com", "cc2@example.com"],
      "employee_list" => ["John Doe", "Jane Smith"],
      "layout" => "notification_layout"
    }
    # Agendando o job para execução imediata
    SchedulerJobManager.perform_async(SendNotificationEmailJob, args)
    # Agendando o job para execução após 1 dia
    SchedulerJobManager.perform_at(SendNotificationEmailJob, Time.now + 1.day, args)
    # Agendando o job para execução após 10 minutos
    SchedulerJobManager.perform_in(SendNotificationEmailJob, 600, args)
  end
end
