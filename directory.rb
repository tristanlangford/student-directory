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

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit enter twices"
  students = []
  name = gets.chomp
  while name.empty? == false
    students.push({name: name, cohort: :november})
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
  names.each { |students| puts "#{students[:name]} (#{students[:cohort]} cohort)"  }
end

def print_footer(names)
  puts "Overall we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)

