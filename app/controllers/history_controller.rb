class HistoryController < ApplicationController
  before_action :set_contact

  def index
    @history = @contact.conversations.where(history: true)
  end

  def show
   @history = @contact.conversations.where(history: true)
  end

  def send_to_history
    @conversation = @contact.conversations.find(params[:id])
    @conversation.update_attribute(:history, true)
    redirect_to contact_history_url
  end

private

    def set_contact
      @contact = Contact.find(params[:contact_id])
    end

end

