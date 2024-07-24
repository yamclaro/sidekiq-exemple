# app/jobs/send_notification_email_job.rb
class SendNotificationEmailJob
  include Sidekiq::Worker

  def perform(args = {})
    manager_email = args["manager_email"]
    employee_list = args["employee_list"] || []
    layout = args["layout"] || "notification_layout"
    cc_emails = args["cc_emails"]


    if manager_email.is_a?(String) && employee_list.is_a?(Array) && layout.is_a?(String)
      NotificationMailer.new_employees_notification(manager_email, cc_emails, employee_list, layout).deliver_now
    else
      raise ArgumentError, "Invalid arguments: #{args.inspect}"
    end
  end
end
