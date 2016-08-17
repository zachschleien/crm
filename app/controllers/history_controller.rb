class HistoryController < ApplicationController
  before_action :set_contact

  def index
    @history = @contact.conversations.where(history: true)
  end

  def show
   @history = @contact.conversations.where(history: true)
  end
  # class ThingsController
  #   def toggle_foo
  #     @thing = Thing.find(params[:id])
  #     @thing.foo = !@thing.foo
  #     @thing.save
  #   end
  # end
  # def send_to_history
  #   @conversation = @contact.conversations.find(params[:id])
  #   !@conversation.history = @conversation.history
  #   @conversation.save
  #     redirect_to root_url
  # end


  # def update
  #   @history = @contact.conversations.update_attributes(:history, true)
  # end

  # def complete
  #     @todo_item.update_attribute(:completed_at, Time.now)
  #     redirect_to @todo_list, notice: "Todo item completed"
  #   end

  def send_to_history
    @contact.conversations.update_attribute(:history, true)
    redirect_to @contact

  end

private

    def set_contact
      @contact = Contact.find(params[:contact_id])
    end

end

