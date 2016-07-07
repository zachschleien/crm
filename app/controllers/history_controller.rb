class HistoryController < ApplicationController

def show
  @contact = Contact.find(params[:id])
  @history = @contact.conversations.where(history)
end

end
