class UserMailer < ActionMailer::Base
  default from: 'do_not_reply@mycrmnetwork.com'

  def reminder_email(user)
    @user = user
    @convos = []
    users = User.all
    users.each do |u|
	    if u.email_reminder == true 
	      @contacts = u.contacts.all
	        @contacts.each do |contact|
	          contact.conversations.each do |conversation|
	            if conversation.follow_up_date.in_time_zone.utc == Date.tomorrow.in_time_zone.utc
	              @convos << conversation
	              # binding.pry
		            end
	            end
	          end
	        end
			 end
				mail(to: @user.email, subject: 'Upcoming Conversation')
		end
end

    # Conversation.includes(:contacts => :users).where(user: { email_reminder: true }).where('follow_up_date > ?', Date.today - 1)
	   #  mail(to: user.email, subject: 'Test')