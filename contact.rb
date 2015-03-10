class Contact
 
  attr_accessor :name, :email, :ph_number
 
  def initialize(name, email, *ph_number)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
    @ph_number = ph_number
  end
 
  def to_s
    # TODO: return string representation of Contact
    "#{@name}, #{@email}, #{ph_number}"
  end

  def add_ph_num(ph_num)
     @ph_number << ph_num
  end
 
  ## Class Methods
  class << self
    def create(name, email, *ph_num )
      # TODO: Will initialize a contact as well as add it to the list of contacts
      ContactDatabase.create_contact(name, email, ph_num)
    end

    def find(index)
      # TODO: Will find and return contact by index
    end
    
    # returns array of contacts
    def all
      ContactDatabase.get_all
    end

    def show(id)
      # TODO: Show a contact, based on ID
      id = id.to_i
      contacts = ContactDatabase.get_all
      contacts.each_with_index do |item, index|
        puts index.to_s + ": " + item.to_s  if id == index
      end
    end
    
  end
 
end
