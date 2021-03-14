require 'sinatra'
require_relative 'contact'

get '/contactsMainMenu' do
    erb :main_menu
end




get '/contacts' do
    @contacts = Contact.all
    erb :contacts
end




get '/editContact' do
    id = params["contactID"]
    @contact = Contact.find(id)
    erb :edit_contact
end

post '/updateContact/:id' do
    contact_to_update = Contact.find(params[:id])
    contact_to_update.first_name = params["first_name"]
    contact_to_update.last_name = params["last_name"]
    contact_to_update.email = params["email"]
    contact_to_update.note = params["note"]
    contact_to_update.save

    redirect to ("/contacts")
end




get '/deleteContact' do
    id = params["contactID"]
    contact_to_delete = Contact.find(id)
    contact_to_delete.destroy
    
    redirect to ("/contacts")
end




get '/addContact' do
    erb :add_contact
end

post '/createContact' do
    Contact.create(:first_name => params["first_name"], :last_name => params["last_name"], :email => params["email"], :note => params["note"])

    redirect to ("/contacts")
end




get '/deleteAllContacts' do
    Contact.destroy_all
    redirect to ("/contacts")
end