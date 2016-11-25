# You can run this via: rake notifications:reminder_email
# To run in heroku:
# 1.install Heroku Scheduler
# 2. click on the scheduler
# 3. enter in: rake notifications:reminder_email
# 4. select a frequency for it to run

# If you want to run this locally, you can either just run the rake command manually or create  a schedule.rb file, and put in:
# every 1.day, :at => '4:30 am' do
#  rake "notifications:reminder_email"
# end
# Then you would run: whenever --update-crontab
# That updates your computers crontab to run whatever command you put in it.
# It'll take a bunch of customization tho, because I don't really know how your computers crontab will know to run the rake command on the correct application
# So... essentially, whenever is probably not useful for you. If you want to run locally to test out, just run the rake command manually.

require 'pry'

namespace :notifications do
  desc "Sends notifications"
  task :reminder_email => :environment do
  
    users = User.where({:email_reminder => true })
    @user = users.each do |u|

      UserMailer.reminder_email(u).deliver
    end
  end
end

