class UserMailer < ApplicationMailer
  default from: 'admin@myblog.blog'
 
  def welcome_email
    @url  = 'http://example.com/login'
    mail(to: "user@email.com", subject: 'Welcome to My Awesome Site')
  end
end
