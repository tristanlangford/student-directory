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

def month_check(month)
months_array = [
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
  loop do
    if months_array.include?(month.downcase)
      return month.capitalize
    else
      puts "ERROR: Please enter a month"
      month = gets.chomp
    end
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit enter twices"
  students = []
  name = gets.chomp
  while name.empty? == false
    puts "Enter #{name}'s cohort"
    cohort_month = gets.chomp
    month = month_check(cohort_month)
    students.push({name: name, cohort: month})
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  return students
end

def print_header
  puts "The students of Villain Academy"
  puts "----------"
end

def print(names)
  list_num = 1
  names.each { |students| 
    puts "#{list_num}. #{students[:name]} (#{students[:cohort]} cohort)"  
    list_num += 1
  }
end

def print_footer(names)
  puts "Overall we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)

