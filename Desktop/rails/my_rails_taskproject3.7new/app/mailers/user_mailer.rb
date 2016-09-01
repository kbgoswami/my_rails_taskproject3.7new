class UserMailer < ApplicationMailer

  def contact_form(email, name, message)
    @message = message
    mail(from: email,
         to: 'kbgoswami@comcast.net',
         subject: "A new contact form message from #{name}")
  end

  def welcome(user)
    @appname = 'Bikesonsale'
    mail(to: user.email, subject: "Welcome to #{@appname}!")
  end
end
