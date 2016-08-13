class HistoryController < ApplicationController
  before_action :set_contact 

  def show
    @contact.conversations.where(history: true)
  end

private

    def set_contact
      @contact = Contact.find(params[:id])
    end

end

