class UserMailer < ApplicationMailer

  def signup_email(user, temp)
    @user = user
    @temp = temp
    @url = 'localhost:3000/users/firstloginpage'
    mail(to: user.email, subject: 'Welcome to Demo!', from: 'signup@demo.com')
  end

end
