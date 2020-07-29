class ShareObituaryMailer < ApplicationMailer
  def inform(recipient, name, sender, id)
    @recipient_name = name
    @sender = sender
    @obit_id = id
    mail(to: recipient, subject: "#{sender.first_name} is sharing an obituary with you")
  end
end
