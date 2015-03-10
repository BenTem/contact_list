## TODO: Implement CSV reading/writing
require 'csv'

class ContactDatabase 
  
  class << self

    def create_contact(name, email)
      contact = Contact.new(name, email)
      CSV.open('contacts.csv', 'a') do |csv|
        csv << [contact.name, contact.email]
      end
    end


    def get_all
      array = []
      CSV.foreach('contacts.csv') do |row|
        name = row[0]
        email = row[1]
        temporary_contact = Contact.new(name, email)
        array << temporary_contact
      end
      array
    end

  end

end
