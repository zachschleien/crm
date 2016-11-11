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

namespace :notifications do
  desc "Sends notifications"
  task :reminder_email => :environment do
    User.find_each do |user|
			contact = user.contacts.each do |contact|
    	require'pry';binding.pry
		    conversation = contact.conversations.each do |conversation|
			      WHERE user.email_reminder && conversation.follow_up_date >= Time.now - 1.day
			      # user.email_reminder && conversation.follow_up_date >= Time.now - 1.day
	        ActionMailer.reminder_email(user).deliver_now
	      end
      end
    end
  end
end

# namespace :notifications do
#   desc "Sends notifications"
# 	  task :reminder_email => :environment do
# 	    User.find.each do |user|
# 			contact = user.contacts.each do |contact|
# 			      if user.email_reminder == true && conversation.follow_up_date == Time.now - 1
# 		        ActionMailer.reminder_email(user).deliver_now
#           end
#         end 
#       end
#     end
#   end
# end
