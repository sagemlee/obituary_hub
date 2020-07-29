class ShareObituaryMailer < ApplicationMailer
  def inform(recipient, sender)
    @user = sender
    @recipient = recipient
    
    mail(to: recipient, subject: "#{@user.first_name} is sharing an obituary with you")
  end
end
