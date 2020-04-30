class ImagegalMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.imagegal_mailer.new_imagegal.subject
  #
  
    

   
    def new_imagegal(imagegal)
      @imagegal = imagegal
      mail to: imagegal.user.email, subject: 'New Post Added'
    end
    def destroy_imagegal(imagegal)
      @imagegal = imagegal
      mail to: imagegal.user.email, subject: 'Post Deleted'
    end
    def update_imagegal(imagegal)
      @imagegal = imagegal
      mail to: imagegal.user.email, subject: 'Post Updated'
    end
end
