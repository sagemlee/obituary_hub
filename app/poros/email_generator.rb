class EmailGenerator

    def message 
        generate_email[:slip][:content]
    end 

    private 

    def content_service
        EmailService.new 
    end 

    def generate_advice 
        content_service.email_info
    end 
end 