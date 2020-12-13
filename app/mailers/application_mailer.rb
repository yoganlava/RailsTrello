class ApplicationMailer < ActionMailer::Base
  default from: 'donotreplystall@gmail.com'
  layout 'mailer'

  def contact_email
    @name = params[:name]
    @message = params[:message]
    mail(to: "ug00031@surrey.ac.uk", subject: "Message Received")
  end
end
