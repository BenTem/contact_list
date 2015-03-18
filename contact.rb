require 'pg'

class Contact

  CONN = PG::Connection.new({
    dbname: 'dbc33egbgj3mpq',
    port: 5432,
    user: 'ilxfasvrrehgwk',
    host: 'ec2-54-204-39-187.compute-1.amazonaws.com',
    password: 'jGzHSn6pBrqFsr5kt-ezYejVp3'
 
})
 
  attr_accessor :firstname, :lastname, :email
  # attr_accessor :ph_number
  attr_reader :id
 
  def initialize(firstname, lastname, email, id=nil, *ph_number)
    # TODO: assign local variables to instance variables
    @firstname = firstname
    @lastname = lastname
    @email = email
    @id = id
    # @ph_number = ph_number
  end

  def is_new?
    @id.nil?
  end

  def save
    if is_new?
      result = CONN.exec_params('INSERT INTO contacts (firstname, lastname, email) VALUES ($1, $2, $3) returning id', [@firstname, @lastname, @email])
      @id = result[0]['id']
    else
      CONN.exec_params('UPDATE contacts SET firstname = $1, lastname = $2, email = $3 WHERE id = $4', [@firstname, @lastname, @email, @id])
    end
  end

  def destroy
    CONN.exec_params('DELETE FROM contacts WHERE id = $1', [@id])
  end
 
  # ## DANGER Below is wet wet code. It's up to you to DRY it out and make it more succinct.

   def self.all
    results = []
    CONN.exec_params('SELECT id, firstname, lastname, email FROM contacts') do |rows|
      rows.each do |row|
        results << Contact.new(
            row['firstname'],
            row['lastname'],
            row['email'],
            row['id']
        )
      end
    end
    results.each do |result|
      result.display
    end
  end
  
  def display
    puts "Name: #{@firstname} #{@lastname}. Email: #{@email}"
  end

  def self.find(id)
    result = nil
    CONN.exec_params('SELECT id, firstname, lastname, email FROM contacts WHERE id = $1 LIMIT 1', [id]) do |rows|
      rows.each do |row|
        result = Contact.new(
            row['firstname'],
            row['lastname'],
            row['email'],
            row['id']
        )
      end
    end
    result.display
  end

  def self.find_by_lastname(lastname)
    result = nil
    CONN.exec_params('SELECT id, firstname, lastname, email FROM contacts WHERE lastname = $1 LIMIT 1', [lastname]) do |rows|
      rows.each do |row|
        result = Contact.new(
            row['firstname'],
            row['lastname'],
            row['email'],
            row['id']
        )
      end
    end
    result.display
  end

  def self.find_by_firstname(firstname)
    result = nil
    CONN.exec_params('SELECT id, firstname, lastname, email FROM contacts WHERE firstname = $1 LIMIT 1', [firstname]) do |rows|
      rows.each do |row|
        result = Contact.new(
            row['firstname'],
            row['lastname'],
            row['email'],
            row['id']
        )
      end
    end
    result.display
  end

  def self.find_by_email(email)
    result = nil
    CONN.exec_params('SELECT id, firstname, lastname, email FROM contacts WHERE email = $1 LIMIT 1', [email]) do |rows|
      rows.each do |row|
        result = Contact.new(
            row['firstname'],
            row['lastname'],
            row['email'],
            row['id']
        )
      end
    end
    result.display
  end
 

 



########################################################

  # def to_s
  #   # TODO: return string representation of Contact
  #   "#{@name}, #{@email}, #{ph_number}"
  # end

  # def add_ph_num(ph_num)
  #    @ph_number << ph_num
  # end
 
  # ## Class Methods
  # class << self
  #   def create(name, email, *ph_num )
  #     # TODO: Will initialize a contact as well as add it to the list of contacts
  #     ContactDatabase.create_contact(name, email, ph_num)
  #   end

  #   def find(index)
  #     # TODO: Will find and return contact by index
  #   end
    
  #   # returns array of contacts
  #   def all
  #     ContactDatabase.get_all
  #   end

  #   def show(id)
  #     # TODO: Show a contact, based on ID
  #     id = id.to_i
  #     contacts = ContactDatabase.get_all
  #     contacts.each_with_index do |item, index|
  #       puts index.to_s + ": " + item.to_s  if id == index
  #     end
  #   end
    
  # end
 
end
