gem 'activerecord', '=4.2.10'
require 'active_record'
require 'mini_record'

puts "Hello-1"

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

puts "Hello-2"

class Contact < ActiveRecord::Base

  field :first_name, as: :string
  field :last_name,  as: :string
  field :email,      as: :string
  field :note,       as: :text 
  
end

# alpha = Contact.create(:first_name => "Ronnie", :last_name => "Hoffer", :email => "ronnie.hoffer@gmail.com", :note => "Trumpet player")
# bravo = Contact.create(:first_name => "Darryl", :last_name => "Hoffer", :email => "darryl.hoffer@gmail.com", :note => "Hockey player")
# charlie = Contact.create(:first_name => "Andy", :last_name => "Hoffer", :email => "andy.hoffer@rogers.com", :note => "Pilot")
# delta = Contact.create(:first_name => "Mita", :last_name => "Hoffer", :email => "mita.hoffer@rogers.com", :note => "Piano player")

Contact.auto_upgrade!