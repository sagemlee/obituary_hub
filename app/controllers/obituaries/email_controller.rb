class Obituaries::EmailController < ApplicationController
    def new 
        @obit = Obituary.find(params[:id])
    end 

    def create 
        recipient = params[:recipient_email]
        #recipient_name = params[:recipient_name]
        sender = current_user
        ShareObituaryMailer.inform(recipient, sender).deliver_now 
        redirect_to "/obituaries/#{params[:id]}"
        flash[:notice] = "You Have Successfully Shared this Obituary in Email"
        
    end 
end 