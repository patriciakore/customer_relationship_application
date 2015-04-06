
require_relative 'Contact'   #from current directory get the file or require_relative
require_relative 'Rolodex'


class Crm # kind of acts like the view

	def self.run	
		my_crm = Crm.new
		my_crm.main_menu
	end

	def initialize
		@rolodex = Rolodex.new
	end

	# enter a number for each selection
	def print_main_menu
		puts " [1] Add new contact"
		puts " [2] Modify an existing contact"
		puts " [3] Delete a contact"
		puts " [4] Display a contact"
		puts " [5] Display all the contacts"
		puts " [6] Display an attribute"
		puts " [7] Exit"
		puts " Enter a selection"
	end


    # call a function based on the selection number
	def call_selection(selection)
		case selection
		when 1
			add_new_contact
		when 2
			modify_contact
		when 3
			delete_contact
		when 4
			display_contact
		when 5
			display_all_contacts
		when 6
			display_by_attribute
		when 7
			exit
		else 
			puts "wrong input"
		end


		
	end

    #
	def main_menu
		while true
			print_main_menu
			selection = gets.chomp.to_i
			call_selection(selection)
		end
    end
    
    # get the first name, last name, email and notes from user input. Create a new contact object with those parameters. 
    # create a new contact object and add it to the rolodex array
	def add_new_contact
		print "First name:"
		first_name = gets.chomp
		print "Last name:"
		last_name = gets.chomp
		print "Email:"
		email = gets.chomp
		print "Notes:"
		note = gets.chomp

		my_contact = Contact.new(first_name,last_name,email,note)
		@rolodex.add_contact(my_contact)	
	end


	def display_by_attribute
		@rolodex.display_all_by_attribute		
	end

	def modify_contact
		print "Enter id of the contact to be modified:"
		contact_id=gets.chomp.to_i
		print "Type yes or no to confirm the selection:"
		confirmation=gets.chomp.to_s
		if confirmation=="yes"
		@rolodex.modify(contact_id)
	    else 
	    end
	end

	def delete_contact
		print "Enter id of the contact to be deleted:"
		contact_id=gets.chomp.to_i
		@rolodex.delete(contact_id)
		puts "contact with id: #{contact_id} has been deleted"
		@rolodex.display_all_contacts
	end

	def display_contact
		print "Enter id of the contact to be displayed: "
		contact_id=gets.chomp.to_i
		@rolodex.display(contact_id)
	end

	def display_all_contacts
		@rolodex.display_all_contacts
	end
    
    def exit
    	puts "exiting the program"
    	abort
    end

end



Crm.run 




