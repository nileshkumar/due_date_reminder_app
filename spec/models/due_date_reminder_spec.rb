require 'rails_helper'

RSpec.describe DueDateReminder, type: :model do
  describe '.reminder_due?' do
    it 'returns true if reminder is due' do
      user = create(:user, activate_reminders: true, due_date_reminder_option: 1, due_date_reminder_interval: 1, time_zone: 'UTC')
      ticket = create(:ticket, user: user, due_date: Time.current + 2.days)

      expect(DueDateReminder.reminder_due?(user, ticket)).to be_truthy
    end

    it 'returns false if reminder is not due' do
      user = create(:user, activate_reminders: true, due_date_reminder_option: 1, due_date_reminder_interval: 1, time_zone: 'UTC')
      ticket = create(:ticket, user: user, due_date: Time.current + 1.week)

      expect(DueDateReminder.reminder_due?(user, ticket)).to be_falsy
    end
  end
end
