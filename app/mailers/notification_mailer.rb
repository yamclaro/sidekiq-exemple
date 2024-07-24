class NotificationMailer < ApplicationMailer
  layout "notification_layout" # Nome do layout sem a extensão

  def new_employees_notification(manager_email, cc_emails, employee_list, layout)
    @manager_email = manager_email
    @employee_list = employee_list
    @layout = layout

    mail(
      to: manager_email,
      cc: cc_emails,
      subject: "Novos Colaboradores Cadastrados") do |format|
      format.html { render layout: @layout }
    end
  end
end
