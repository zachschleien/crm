class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  def index
    @contacts = current_user.contacts.all.order('created_at DESC')
    # @conversations = Conversation.where(history: false).order("created_at ASC")
  end

  # def show
  #   @conversations = Conversation.all.order("created_at DESC").where(history: false)
  # end

  def new
    @contact = current_user.contacts.build
  end

  def create
    @contact = current_user.contacts.build(contact_params)
    if @contact.save
      redirect_to @contact, notice: "Contact was successfully created."
    else
      render 'new'
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    if @contact.update(contact_params)
      redirect_to contact_path(@contact), notice: 'Contact was successfully updated.'
    else
      render 'edit'
    end
  end



  def destroy
    @contact.destroy
    redirect_to root_url, notice: 'Contact was successfully deleted.'
  end

  private

    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:name, :avatar)
    end

end
