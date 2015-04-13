class UserMailer < ApplicationMailer

  def signup_email(user, temp)
    @user = user
    @temp = temp
    @url = users_firstloginpage_url
    mail(to: user.email, subject: 'Welcome to Arrange an Exchange!', from: 'signup@arrangeanexchange.com')
  end

  def connect_email(user, fam, content)
    @user = user
    @fam = fam
    @content = content
    @to = @fam.users.first
    mail(to: @to.email, subject: "#{@user.name} from #{@user.country} wishes to connect!", from: user.email)
  end

  def host_review_email(user, trav, fam, review, rating)
    @user = user
    @fam = fam
    @review = review
    @rating = rating
    @to = @fam.users.first
    @trav = trav
    mail(to: @to.email, subject: "#{@trav.name} wants to review their stay with you!", from: user.email)
  end

end
