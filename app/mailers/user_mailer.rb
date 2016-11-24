class UserMailer < ActionMailer::Base
  default from: 'from@example.com'

  def reminder_email(user)
    @user = user
    User.find_each do |user|
		# if user.email_reminder == true 
		#     contacts = user.contacts
		#     contacts.each do |contact|
		#     contact.conversations.each do |conversation|
		    		mail(to: @user.email, subject: 'test')
		    	end
		  # 	end
		  # end
    # Conversation.includes(:contacts => :users).where(user: { email_reminder: true }).where('follow_up_date > ?', Date.today - 1)
	   #  mail(to: user.email, subject: 'Test')
		# end
  end
end