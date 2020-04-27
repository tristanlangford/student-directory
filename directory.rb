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
    if months_array.include?(month.downcase) # check month in array & downcase input
      return month.capitalize # return month capitalized
    else
      puts "ERROR: Please enter a month" # error message
      month = gets.chomp # updates month with new inpu
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
    puts "Now we have #{students.count} students" # count check for user
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
  list_num = 1 # variable for list index
  names.each { |students| 
    puts "#{list_num}. #{students[:name]} (#{students[:cohort]} cohort)"  
    list_num += 1 # iterate through list and print line above & update index
  }
end

def print_footer(names) # footer for final output
  puts "Overall we have #{names.count} great students" # tells user count of students
end

students = input_students # start by requesting users
cohort = list_by_cohort(students)
print_header
print_students(cohort)
print_footer(students) # print footer

