class DueDateReminderJob < ApplicationJob
  queue_as :default

  def perform
    DueDateReminder.send_reminders
  end
end
