class HistoryController < ApplicationController

def show
  @contact = Contact.find(params[:id])
  @contact.conversations = Contact.filter_by_history_false(@contact.conversations)
end

end
