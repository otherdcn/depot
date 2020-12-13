class SupportRequestMailer < ApplicationMailer
  default from: "support@example.org"

  def respond(support_request)
    @support_request = support_request
    mail to: @support_request.email, subject: "Re: #{@support_request.subject}"
  end
end
