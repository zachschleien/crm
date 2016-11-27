class UserMailer < ActionMailer::Base
  default from: 'do_not_reply@mycrmnetwork.com'

  def reminder_email(user)
    @user = user
    users = User.all
    @convos = []
    users.each do |u|
	     
	      @contacts = u.contacts.all
	        @contacts.each do |contact|
	          contact.conversations.each do |conversation|
					    if (u.email_reminder == true) && (conversation.follow_up_date.in_time_zone.utc == Date.tomorrow.in_time_zone.utc)
						    	# && (convo.contact.user == @user)
				            @convos << conversation
									require 'pry';binding.pry
											mail(to: @user.email, subject: 'Upcoming Conversation')
	              # end
	            end
            end
          end
        end

	              # binding.pry
		end
end

    # Conversation.includes(:contacts => :users).where(user: { email_reminder: true }).where('follow_up_date > ?', Date.today - 1)
	   #  mail(to: user.email, subject: 'Test')