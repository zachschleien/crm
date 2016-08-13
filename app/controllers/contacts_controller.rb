class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    @contacts = Contact.all.order('created_at DESC')
  end

  def show
  end

  def new
    @contact = current_user.contacts.build
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def create
    @contact = current_user.contacts.build(contact_params)
    if @contact.save
      redirect_to @contact, notice: "Contact was successfully created."
    else
      render 'new'
    end
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
      params.require(:contact).permit(:name)
    end

end
