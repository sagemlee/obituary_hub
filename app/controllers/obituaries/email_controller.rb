class Obituaries::EmailController < ApplicationController
    def new 
        @obit = Obituary.find(params[:id])
    end 

    def create 
        @email = EmailGenerator.new
        recipient = params[:recipient_email]

        email_info = { user: current_user,
                       recipient: params[:recipient_name], 
                       message: @email.message
                    }
        ShareObituaryMailer.inform(email_info, recipient).deliver_now 
        flash[:notice] = "You Have Successfully Shared this Obituary in Email"

        redirect_to "/obituaries/#{params[:obit_it]}"
    end 
end