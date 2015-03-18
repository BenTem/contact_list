require_relative 'contact'
require_relative 'contact_database'
require 'pp'

def accept_argv

  # input = ARGV.shift

  input = []
  while !ARGV.empty?
    input << ARGV.shift
  end

  case input[0]
  when'help'
    puts "Here is a list of available commands:
              update  - Create a new contact
              list - List all contacts
              show - Show a contact
              find - Find a contact"
  when 'update'
    create_new
  when 'list'
    print_all
  when 'show'
    id = input[1]
    show_contact(id)
  when 'find'
    search(input[1])
  end
end

def create_new
  puts "Enter contact's first name:"
  first_name = gets.chomp
  puts "Enter contact's last name:"
  last_name = gets.chomp
  puts "Enter contact's email:"
  new_email = gets.chomp

  new_contact = Contact.new(first_name, last_name, new_email)
  new_contact.save
  puts "Contact added"
end

def print_all
  Contact.all
end

def show_contact(id)
  Contact.find(id)
end

def search(term)
  puts "Would you like to search for firstname, lastname, or email?"
  choice = gets.chomp
  case choice
  when 'firstname'
    Contact.find_by_firstname(term)
  when 'lastname'
    Contact.find_by_lastname(term)
  when 'email'
    Contact.find_by_email(term)
  end

end

accept_argv

##############
# def create_new
  # contacts = ContactDatabase.get_all
  # puts 'enter new contact email'
  # contact_email = gets.chomp

  # contacts.each do |item|
  #   item = item.to_s
  #   if item.include? contact_email
  #     puts "that contact already exists"
  #     create_new 
  #     return
  #   end
  # end

  # puts 'enter new contact name:'  
  # contact_name = gets.chomp
  # @new_number = ""
  # @loop = "YES"

  # while @loop == "YES"
  #   puts 'phone number:'
  #   ph_num = gets.chomp
  #   puts 'number label (ie home, mobile):'
  #   ph_label = gets.chomp
  #   @new_number += "#{ph_label}: #{ph_num}, "
  #   @new_number
  #   puts 'more phone numbers?'
  #   @loop = gets.chomp
  # end

  # Contact.create(contact_name, contact_email, @new_number)
  # puts "contact added"
# end

# def print_all
#   contacts = Contact.all
#   contacts.each_with_index do |item, index|
#     puts index.to_s + ": " + item.to_s
#   end
# end

# def show_contact(id)
#   Contact.show(id)
# end

# def search(term)
#   array = []
#   contacts = ContactDatabase.get_all
#   contacts.each do |item|
#     item = item.to_s
#     array << item if item.include? term
#     end
#   puts array
# end

