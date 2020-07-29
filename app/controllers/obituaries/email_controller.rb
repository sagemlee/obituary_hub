class Obituaries::EmailController < ApplicationController
    def new 
        @obit = Obituary.find(params[:id])
    end 

    def create 
        recipient = params[:recipient_email]
        recipient_name = params[:recipient_name]
        sender = current_user
        obit_id = params[:id]
        ShareObituaryMailer.inform(recipient, recipient_name, sender, obit_id).deliver_now 
        redirect_to "/obituaries/#{obit_id}"
        flash[:notice] = "You Have Successfully Shared this Obituary in Email"
        
    end 
end 