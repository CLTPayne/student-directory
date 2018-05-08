# let's put all students into an array
=begin
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
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

# let's get the user to input the student names
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{(students.index { |x| x == student }) + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)

# Only print students who's names begin with a certain character
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{(students.index { |x| x == student }) + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_students_beginning_with(students)
  puts "What letter who you like: "
  letter = gets.chomp
  students.each do |student|
    if student[:name].chars[0] == letter.upcase
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
students = input_students
# nothing happens until we call the methods
print_header
print_students_beginning_with(students)
print_footer(students)

# Only print students who's names are less than 12 characters long
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# Print a numbered list of students starting with their position in the hash
def print(students)
  students.each do |student|
    puts "#{(students.index { |x| x == student }) + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_students_beginning_with(students)
  puts "What letter who you like: "
  letter = gets.chomp
  students.each do |student|
    if student[:name].chars[0] == letter.upcase
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

 def print_students_less_than_twelve_chars(students)
   students.each do |student|
     if student[:name].length < 12
     puts "#{student[:name]} (#{student[:cohort]} cohort)"
     end
   end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
students = input_students
# nothing happens until we call the methods
print_header
print_students_less_than_twelve_chars(students)
print_footer(students)
=end

# Rewrite the each() method for printing students to use while control flow
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# Print a numbered list of students starting with their position in the hash using a while loop
def print(students)
  students_index = 0
  while students.length > students_index do
    puts "#{students_index + 1}. #{students[students_index][:name]} (#{students[students_index][:cohort]} cohort)"
    students_index += 1
  end
end

def print_students_beginning_with(students)
  puts "What letter who you like: "
  letter = gets.chomp
  students.each do |student|
    if student[:name].chars[0] == letter.upcase
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

 def print_students_less_than_twelve_chars(students)
   students.each do |student|
     if student[:name].length < 12
     puts "#{student[:name]} (#{student[:cohort]} cohort)"
     end
   end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
