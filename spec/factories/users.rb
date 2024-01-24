FactoryBot.define do
  factory :user do
    activate_reminders { true }
    due_date_reminder_interval { 1 }
    due_date_reminder_option { 1 }
    time_zone { 'UTC' }
  end
end