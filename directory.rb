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

# Add some more info to the hash
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november, hobbies: "eating", country_of_birth: "Denmark", height: 2.00},
  {name: "Darth Vader", cohort: :november, hobbies: "breathing", country_of_birth: "Tatooine", height: 2.10},
  {name: "Nurse Ratched", cohort: :november, hobbies: "reading", country_of_birth: "USA", height: 1.67},
  {name: "Michael Corleone", cohort: :november, hobbies: "jogging", country_of_birth: "USA", height: 1.89},
  {name: "Alex DeLarge", cohort: :november, hobbies: "theatre going", country_of_birth: "USA", height: 2.01},
  {name: "The Wicked Witch of the West", cohort: :november, hobbies: "flying", country_of_birth: "USA", height: 1.68},
  {name: "Terminator", cohort: :november, hobbies: "terminating", country_of_birth: "Austria", height: 2.15},
  {name: "Freddy Krueger", cohort: :november, hobbies: "chopping", country_of_birth: "USA", height: 1.87},
  {name: "The Joker", cohort: :november, hobbies: "poetry", country_of_birth: "USA", height: 1.91},
  {name: "Joffrey Baratheon", cohort: :november, hobbies: "swimming", country_of_birth: "USA", height: 1.89},
  {name: "Norman Bates", cohort: :november, hobbies: "cooking", country_of_birth: "Australia", height: 1.92}
]

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# Print a numbered list of students starting with their position in the hash using a while loop
def print(students)
  students_index = 0
  while students.length > students_index do
    puts "#{students_index + 1}. #{students[students_index][:name]} (#{students[students_index][:cohort]} cohort)"
    puts "Height: #{students[students_index][:height]} metres"
    puts "Who enjoys #{students[students_index][:hobbies]} and was born in #{students[students_index][:country_of_birth]}"
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
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
=end

# Display the info using center()
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
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print(students)
  students_index = 0
  while students.length > students_index do
    puts "#{students_index + 1}. #{students[students_index][:name]} (#{students[students_index][:cohort]} cohort)".center(50)
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
  puts "Overall, we have #{students.count} great students".center(50)
end
students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
