require_relative 'contact'
require_relative 'contact_database'

def accept_argv

  # input = ARGV.shift

  input = []
  while !ARGV.empty?
    input << ARGV.shift
  end

  case input[0]
  when'help'
    puts "Here is a list of available commands:
              new  - Create a new contact
              list - List all contacts
              show - Show a contact
              find - Find a contact"
  when 'new'
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

  contacts = ContactDatabase.get_all

  puts 'enter new contact email'
  contact_email = gets.chomp

  contacts.each do |item|
    item = item.to_s
    if item.include? contact_email
      puts "that contact already exists"
      create_new 
      return
    end
  end

  puts 'enter new contact name:'  
  contact_name = gets.chomp
  Contact.create(contact_name, contact_email)
  puts "contact added"
end

def print_all
  contacts = Contact.all
  contacts.each_with_index do |item, index|
    puts index.to_s + ": " + item.to_s
  end
end

def show_contact(id)
  Contact.show(id)
end

def search(term)
  array = []
  contacts = ContactDatabase.get_all
  contacts.each do |item|
    item = item.to_s
    array << item if item.include? term
    end
  puts array
end

accept_argv