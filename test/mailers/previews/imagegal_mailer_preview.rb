# Preview all emails at http://localhost:3000/rails/mailers/imagegal_mailer
class ImagegalMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/imagegal_mailer/new_imagegal
  def new_imagegal
    imagegal = Imagegal.last
    ImagegalMailer.new_imagegal(imagegal)
    
  end
  def destroy_imagegal
    imagegal = Imagegal.last
    ImagegalMailer.destroy_imagegal(imagegal)
    
  end
  def update_imagegal
    imagegal = Imagegal.last
    ImagegalMailer.update_imagegal(imagegal)
    
  end
end
