module Api
    class ContactController < ApplicationController
        def send_contact
            puts params

            begin
                ApplicationMailer.with(name: params[:name], message: params[:message]).contact_email.deliver
                render json: {message: "Mail Sent"}
            rescue
                render json: {error: "Error in sending mail"}
            end
        end
    end
end