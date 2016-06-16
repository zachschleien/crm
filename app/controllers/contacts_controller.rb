class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    @contacts = Contact.all
  end

  def show
  end

  def new
    @contact = current_user.contacts.build
  end

  def edit
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
  end


  def destroy
  end



  private

    def set_contact
      @contact = Contact.find(params[:id])
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

    def contact_params
      params.require(:contact).permit(:name, :status, :method, :action_items, :conversation_date, :follow_up_date)

    end

end
