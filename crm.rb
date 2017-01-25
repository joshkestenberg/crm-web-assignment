# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
require 'sinatra'
require_relative 'contact'

Contact.create('Betty', 'Maker', 'betty@bitmakerlabs.com', 'Developer')
Contact.create('Dick', 'Army', 'ass@bitmakerlabs.com', 'Dickweed')
Contact.create('Stink', 'McCoy', 'stinker@bitmakerlabs.com', 'Fartbutt')

get '/' do
  redirect to('/contacts')
end

get '/contacts' do
  erb :contacts
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

get '/about' do
  erb :about
end

get '/contacts/new' do
  erb :new_contact
end

post '/contacts' do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/contacts')
end
