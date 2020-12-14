# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
    def contact_email
        ApplicationMailer.with(name: params[:name] || "Udeshya", message: params[:message] || "Hello").contact_email
    end
end
