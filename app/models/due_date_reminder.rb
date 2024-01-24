class DueDateReminder
  def self.send_reminders
    users = User.where(activate_reminders: true)

    users.each do |user|
      user.tickets.each do |ticket|
        send_notification(user, ticket) if reminder_due?(user, ticket)
      end
    end
  end

  private

  def self.reminder_due?(user, ticket)
    due_date = ticket.due_date.in_time_zone(user.time_zone)
    reminder_time = calculate_reminder_time(user)

    (Time.current.in_time_zone(user.time_zone) + user.due_date_reminder_interval.hours) >= (due_date - reminder_time) &&
      (Time.current.in_time_zone(user.time_zone) + user.due_date_reminder_interval.hours) <= (due_date - reminder_time + 1.minute)
  end

  def self.calculate_reminder_time(user)
    case user.due_date_reminder_option
    when 0
      0.hours
    when 1
      1.day
    else
      0.hours
    end
  end

  def self.send_notification(user, ticket)
    NotificationMailer.reminder_email(user, ticket).deliver_later
  end
end