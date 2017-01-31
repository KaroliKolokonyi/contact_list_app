class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def new
   
  end

  def create
    @answer = Contact.new({first_name:params[:first_name], last_name:params[:last_name], email:params[:email], phone_number:params[:phone_number]})

    @answer.save

    redirect_to "/contacts"

    flash[:success] = "The contact created!"
  end

  def show
    @contact = Contact.find_by(id:params[:id])


    if params[:id] == "random"
      @contact= Contact.all.sample
    else
      @contact = Contact.find_by(id: params[:id])
    end

  end

  def edit
    @contact = Contact.find_by(id:params[:id])
  end

  def update
    @contact = Contact.find_by(id:params[:id])
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.phone_number = params[:phone_numbe]
    @contact.save

    flash[:success] = "The contact  updated!"
    redirect_to "/contacts"
    
  end

  def destroy
    @contact = Contact.find_by(id:params[:id])
    @contact.delete
    
    flash[:warning] = "The contact deleted"
    redirect_to "/contacts"
    
  end

 def search
    search_query = params[:search_input]
    @contact = Contact.where("first_name LIKE ? OR last_name LIKE ?", "%#{search_query}%", "%#{search_query}%")

    if @contact.empty?

      flash[:info] = "No Contacts found in search"
    end
    render :index
  end

end