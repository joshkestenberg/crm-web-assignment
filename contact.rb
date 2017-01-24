# Copy your entire Contact class from the old crm assignment here.
# Then, run the following at the command line:
#
#   ruby test/contact_test.rb
#
# If your implementation of the Contact class is 'right', then you should see that all tests pass!
class Contact

  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :id

  @@contacts = []
  @@next_id = 1

  #displays all contacts
  def self.all
    @@contacts
  end

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @id = @@next_id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @@next_id += 1
    self.display
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name,last_name,email,note)
    new_contact = self.new(first_name, last_name, email, note)
    @@contacts << new_contact
    new_contact
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do |contact|
      if contact.id == id
        return contact
      end
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, edited)
    if attribute == "first_name"
      @new_first_name = edited
      @first_name = (@new_first_name)
    elsif attribute == "last_name"
      @new_last_name = edited
      @last_name = (@new_last_name)
    elsif attribute == "email"
      @new_email = edited
      @email = (@new_email)
    elsif attribute == "note"
      @new_note = edited
      @note = (@new_note)
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
    @@contacts.each do |contact|
      case attribute
        when "id"
          if contact.id == value
            return contact
          end
        when "first_name"
          if contact.first_name == value
            return contact
          end
        when "last_name"
          if contact.last_name == value
            return contact
          end
        when"email"
          if contact.email == value
            return contact
          end
        when "note"
          if contact.note == value
            return contact
          end
        end
    end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts.clear
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end

  # Feel free to add other methods here, if you need them.
  def display
    puts "contact info:\n id: #{@id}\n first name: #{@first_name}\n last name: #{@last_name}\n email: #{@email}\n note: #{@note}"
  end


end
