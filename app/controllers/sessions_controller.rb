class SessionsController < ApplicationController

    def create 
        access_token = request.env["omniauth.auth"]
        user = User.create_from_omniauth(access_token)

        user.google_token = access_token.credentials.token 


        refresh_token = access_token.credentials.refresh_token 
        user.google_refresh_token = refresh_token if refresh_token.present? 
        user.save!  
        
        cookies.encrypted[:current_user_id] = { value: user.id, expires: Time.now + 7.days }

        redirect_to "/"
    end

    def destroy 
        cookies.encrypted[:current_user_id] = nil

        redirect_to "/"
    end 
end
