class ConversationsController < ApplicationController
  before_action :set_contact 
  before_action :set_conversation, except: [:create, :new]

  def new
    @conversation = @contact.conversations.build
  end

  def create
    @conversation = @contact.conversations.create(conversation_params)
    redirect_to @contact
  end

  def edit
    @conversation = Conversation.find(params[:id])
  end

  def update
    if @conversation.update(conversation_params)
      redirect_to @contact, notice: 'Conversation was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    if @conversation.destroy
      flash[:success] = "Conversation was deleted."
    else
      flash[:error] = "Conversation could not be deleted."
    end
    redirect_to @contact
  end

  # def send_to_history
  #   @conversation = Conversation.find(params[:id])
  #   @conversation.update_attributes(history: true)
  #   redirect_to projects_path(history: false)
  # end

  def downgrade
     @wikis = current_user.wikis
     @user = User.find(params[:id])
     @user.update_attribute(:premium, false)
     @wikis.each do |wiki|
       wiki.update_attribute(:private, false)
     end 
   end

  private

    def set_contact
      @contact = Contact.find(params[:contact_id])
    end

    def set_conversation
      @conversation = @contact.conversations.find(params[:id])
    end

    def conversation_params
      params[:conversation].permit(:topic, :contact_method, :next_step, :last_contacted, :follow_up_date, :conversation_completed)
    end

end
