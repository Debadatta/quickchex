class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @contacts = Contact.all
      respond_to do |format|
       format.html
       format.json { render :json => @contacts.to_json(:methods => [:formatted_time, :day]) }
       format.js { render :contacts => @contacts.pluck(:name).to_json}
      end
  end

  def search
    value = params[:value]
        
    @contacts = Contact.where("LOWER(name) like '%#{value.to_s.downcase}%' OR phone like '%#{value}%'")
respond_to do |format|
       
       format.js
      end
  end

  def show
    respond_with(@contact)
  end

  def new
    @contact = Contact.new
    respond_with(@contact)
  end

  def edit
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.save
    respond_with(@contact)
  end

  def update
    @contact.update(contact_params)
    respond_with(@contact)
  end

  def destroy
    @contact.destroy
    respond_with(@contact)
  end

  def contact_list
    @contacts = Contact.all
    respond_with(@contacts)
  end

  

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:name, :phone)
    end
end
