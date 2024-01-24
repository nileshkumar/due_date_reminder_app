class NotificationMailer < ApplicationMailer

  def reminder_email(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'Due Date Reminder')
  end
end
