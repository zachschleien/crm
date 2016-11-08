namespace :notifications do
  desc "Sends notifications"
  every :day, at: '4:00 am' do
    task :reminder_email => :environment do
      User.all.each do |user|
        if user.email_reminder == true && conversations.follow_up_date == Time.now - 1
          ActionMailer.reminder_email(user).deliver_now
        end
      end
    end
  end
end
