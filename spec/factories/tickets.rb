FactoryBot.define do
  factory :ticket do
    title { 'Sample Ticket' }
    description { 'Sample Description' }
    due_date { Time.current + 1.week }
    association :user, factory: :user
  end
end