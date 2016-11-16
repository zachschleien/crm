class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def reminder_email(user)
    @user = user
    mail(to: @user.email, subject: 'Test')
  end

end