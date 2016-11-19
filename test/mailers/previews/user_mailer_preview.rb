class UserMailerPreview < ActionMailer::Preview
  def reminder_email
    UserMailer.reminder_email(User.first)
  end
end