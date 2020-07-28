class ShareObituaryMailer < ApplicationMailer 
  def inform(info, recipient)
    @user = info[:user]
    @message = info[:message]
    @recipient = info[:recipient]
    mail(to: recipient, subject: "#{@user.name} is sharing an obituary with you")
  end
end 