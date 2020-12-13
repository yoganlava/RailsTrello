require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase

  test 'send mail' do
    @request.params[:name] = "Udeshya"
    @request.params[:message] = "Hello"

    email = ApplicationMailer.contact_email

    assert_email 1 do
      email.deliver_now
    end
  end

  test 'corrent to address' do
    @request.params[:name] = "Udeshya"
    @request.params[:message] = "Hello"

    email = ApplicationMailer.contact_email

    assert_equal "Udeshya", email.to
  end

  test 'correct subject' do
    @request.params[:name] = "Udeshya"
    @request.params[:message] = "Hello"

    email = ApplicationMailer.contact_email

    assert_equal "Message Received", email.subject
  end

end
