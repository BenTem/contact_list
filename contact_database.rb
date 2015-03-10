## TODO: Implement CSV reading/writing
require 'csv'

class ContactDatabase 
  
  class << self

    def create_contact(name, email, *ph_number)
      contact = Contact.new(name, email, *ph_number)
      CSV.open('contacts.csv', 'a') do |csv|
        csv << [contact.name, contact.email, contact.ph_number]
      end
    end


    def get_all
      array = []
      CSV.foreach('contacts.csv') do |row|
        name = row[0]
        email = row[1]
        ph_number = row[2]
        temporary_contact = Contact.new(name, email, ph_number)
        array << temporary_contact
      end
      array
    end

  end

end
