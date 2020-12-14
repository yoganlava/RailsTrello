require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase

  test 'send mail' do
    email = ApplicationMailer.with(name: "Udeshya", message: "Hello").contact_email

    assert_emails 1 do
      email.deliver_now
    end
  end

  test 'correct to address' do
    email = ApplicationMailer.with(name: "Udeshya", message: "Hello").contact_email

    assert_equal ["ug00031@surrey.ac.uk"], email.to
  end

  test 'correct subject' do
    email = ApplicationMailer.with(name: "Udeshya", message: "Hello").contact_email

    assert_equal "Message Received", email.subject
  end

end
