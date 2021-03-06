require 'csv'

def try_load_file
  filename = ARGV.first # first argument from command line
  filename = "students.csv" if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry #{filename} doesn't exist"
    exit
  end
end

def puts_students(student_array)
  index = 1
  student_array.each { |students|
    puts "#{index}:- #{students[:name]} (#{students[:cohort]} cohort)" 
    index += 1
  }
end

def interactive_menu
  loop do
    print_menu # print options to user
    process(STDIN.gets.chomp) # take user input and process code as per interactive menu
  end
end

def print_menu
  puts "1. Inputs Students"
  puts "2. Show all Students"
  puts "3. Show Students by Cohort"
  puts "4. Save changes"
  puts "5. Load Students from file"
  puts "9. Exit"
end

@students = []

def process(selection) # takes user input and acts on it
  case selection
    when "1"
      input_students
    when "2"
      if @students.empty?
        puts "Currently no Students"
      else
        print_header
        print_students
        print_footer
      end
    when "3"
      if @students.empty?
        puts "Currently no Students"
      else
        list_by_cohort
        print_footer
      end
    when "4"
      save_students
    when "5"
      puts "Enter file name you want to load"
      filename = STDIN.gets.chomp
      if filename == "students.csv"
        puts "students.csv already loaded"
      elsif File.exists?(filename)
        load_students(filename)
        puts "Loaded #{@students.count} from #{filename}"
      else
        puts "Sorry #{filename} doesn't exist"
      end
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def load_students(filename = "students.csv")
  CSV.foreach(filename) do |row|
      name, cohort = row
      @students = @students.push({name: name, cohort: cohort})
    end
end

def save_students
  puts "Enter file you want to save to (Press Enter again to save to default)"
  filename = STDIN.gets.chomp
  filename = "students.csv" if filename.empty?
  if File.exists?(filename)
    CSV.open("#{filename}", "w") do |csv|
      @students.each { |student|
        student_data = [student[:name], student[:cohort]]
        csv << student_data
      }
    end
  else
    puts "Sorry #{filename} doesn't exist"
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
    if month.empty? # check for input and sets deafult if nothing entered
      puts "If no month is entered, it will be set to default (January)"
      input = gets.chomp
      month = input if input.empty? == false
      return months_array[0].capitalize if input.empty?
    else
      if months_array.include?(month.downcase) # check month in array & downcase input
        return month.capitalize # return month capitalized
      else
        puts "ERROR: Please enter a month" # error message
        month = gets.chomp # updates month with new input
      end
    end
  end
end

def input_students # Method to request student details
  puts "Please enter the names of the students" # The request for name
  puts "To finish, just hit enter twices" # How to exit input method
  name = STDIN.gets.chomp # capture name input
  while name.empty? == false # check to see if use wants to finish
    puts "Enter #{name}'s cohort" # Request for cohort
    month = month_check(gets.chomp) # call to month check method
    @students.push({name: name, cohort: month}) # push values into array with keys
    if @students.count == 1
      puts "Now we have our first great student(Press Enter again to stop)" # first student message
    else
      puts "Now we have #{@students.count} students(Press Enter again to stop)" # count check for user
    end
    name = STDIN.gets.chomp # next input
  end
end

def list_by_cohort # Method to request view of certain cohort
  puts "Name cohort to view:" # request input
  cohort_month = month_check(STDIN.gets.chomp) # check they entered a month
  list = [] # new array to caputre qualifying students
  # iterate through students to find correct ones
  @students.map { |student| list.push(student) if student[:cohort] == cohort_month }
  if list.empty?
    puts "No students in #{cohort_month} cohort"
  else
    puts_students(list) # iterate through list and print line above
  end
end

def print_header # header for final output
  puts "The students of Villain Academy"
  puts "----------"
end

def print_students # method to print names in list
  puts_students(@students)
end


def print_footer # footer for final output
  # tells user count of students. Only if students exist
  puts "Overall we have #{@students.count} great students" if @students.count > 0
end

try_load_file
interactive_menu
