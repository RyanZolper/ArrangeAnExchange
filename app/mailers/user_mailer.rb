class UserMailer < ApplicationMailer

  def signup_email(user, temp)
    @user = user
    @temp = temp
    @url = 'localhost:3000/users/firstloginpage'
    mail(to: user.email, subject: 'Welcome to Demo!', from: 'signup@demo.com')
  end

  def connect_email(user, fam, content)
    @user = user
    @fam = fam
    @content = content
    @url = "localhost:3000/showfam/#{@user.family.id}"
    @to = @fam.users.first
    mail(to: @to.email, subject: "#{@user.name} from #{@user.country} wishes to connect!", from: user.email)
  end

end
