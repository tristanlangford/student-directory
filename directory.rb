students = [
{name: "Dr. Hannibal Lecter", cohort: :november},
{name: "Darth Vader", cohort: :november},
{name: "Nurse Ratched", cohort: :november},
{name: "Michael Corleone", cohort: :november},
{name: "Alex DeLarge", cohort: :november},
{name: "The Wicked Witch of the West", cohort: :november},
{name: "Terminator", cohort: :november},
{name: "Freddy Krueger", cohort: :november},
{name: "The Joker", cohort: :november},
{name: "Joeffrey Baratheon", cohort: :november},
{name: "Norman Bates", cohort: :november}
]

def interactive_menu
  master_student_list = []
  loop do
    puts "1. Inputs Students"
    puts "2. Show all Students"
    puts "3. Show Students by Cohort"
    puts "9. Exit"
    selection = gets.chomp
    case selection
      when "1"
        students = input_students
        master_student_list = master_student_list + students
      when "2"
        if master_student_list.empty? 
          puts "Currently no Students"
        else
          print_header
          print_students(master_student_list)
          print_footer(master_student_list)
        end
      when "3"
        cohort = list_by_cohort(master_student_list)
        if cohort == nil
          puts "Currently no Students"
        else
          print_students(cohort)
          print_footer(master_student_list)
        end
      when "9"
        exit
      else
        puts "I don't know what you meant, try again"
    end
  end
end
        

def month_check(month) # method to check month input correct
months_array = [ # array of month
"january",
"february",
"march",
"april",
"may",
"june",
"july",
"august",
"september",
"october",
"november",
"december"
]
  loop do # loop until input correct
    if month.empty?
      puts "If not month is entered, it will be set to default (January)"
      input = gets.chomp
      month = input if input.empty? == false
      return months_array[0].capitalize if input.empty?
    else
      if months_array.include?(month.downcase) # check month in array & downcase input
        return month.capitalize # return month capitalized
      else
        puts "ERROR: Please enter a month" # error message
        month = gets.chomp # updates month with new inpu
      end
    end
  end
end

def input_students # Method to request student details
  puts "Please enter the names of the students" # The request for name
  puts "To finish, just hit enter twices" # How to exit input method
  students = [] # Create array to capture details
  name = gets.chomp # capture name input
  while name.empty? == false # check to see if use wants to exit
    puts "Enter #{name}'s cohort" # Request for cohort
    cohort_month = gets.chomp # user cohort input
    month = month_check(cohort_month) # call to month check method
    students.push({name: name, cohort: month}) # push values into array with keys
    if students.count == 1
      puts "Now we have our first great student(Press Enter again to stop)" # first student message
    else
      puts "Now we have #{students.count} students(Press Enter again to stop)" # count check for user
    end
    name = gets.chomp # next input
  end
  return students # return array of students
end

def list_by_cohort(students) # Method to request view of certain cohort
  puts "Name cohort to view:" # request input
  month = gets.chomp # take month input
  cohort_month = month_check(month) # check they entered a month
  list = [] # new array to caputre qualifying students
  students.map { |student|
    list.push(student) if student[:cohort] == cohort_month
  } # iterate through students to find correct ones
  return list # return the list
end 

def print_header # header for final output
  puts "The students of Villain Academy"
  puts "----------" # space for asthetics
end

def print_students(names) # method to print names in list
  if names.empty?
    puts "No Students at Villains Academy"
  else
    list_num = 1 # variable for list index
    names.each { |students| 
      puts "#{list_num}. #{students[:name]} (#{students[:cohort]} cohort)"  
      list_num += 1 # iterate through list and print line above & update index
    }
  end
end

def print_footer(names) # footer for final output
  # tells user count of students. Only if students exist
  puts "Overall we have #{names.count} great students" if names.count > 0
end

interactive_menu
