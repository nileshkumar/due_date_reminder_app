require "test_helper"

class NotificationMailerTest < ActionMailer::TestCase
  test "reminder_email" do
    mail = NotificationMailer.reminder_email
    assert_equal "Reminder email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
