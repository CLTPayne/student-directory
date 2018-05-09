@students = [] #an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll add more items
end

def interactive_menu
  # declare the students variable outside the loop as if inside it wouldn't be available for all iterations of the loop.
  # students = []
  # 4. Be able to keep repeating from step 1
  loop do
  # 1. print the menu and ask the user what to do
    print_menu
    # 2. read the input and save it into a variable
    # 3. do what the user has asked
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice times"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
      if @students.count < 2
        puts "Now we have #{@students.count} student"
      else puts "Now we have #{@students.count} students"
      end
      # get another name from the user
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  # open the file for reading
  file = File.open(filename, "r")
  # iterate over the contents of the file
  file.readlines.each do |line|
    # split every line at the comma, which gives an array with two elements, assign to the name and cohort variables.
    # this is a parallel assignment (assigning two variables at the same time)
    name, cohort = line.chomp.split(",")
    # put a new hash into the @students array, with the cohort as a symbol for consistency
    @students << {name: name, cohort: cohort.to_sym}
  end
  # close the file
  file.close
end

def try_load_students
  filename = ARGV.first # first arguement from the command line
  return if filename.nil? # get out of this method if it isn't given
  if File.exists? (filename) #if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu

# ----- OTHER VERSIONS AS PER THE TASKS ----------
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

# Ask user for cohort as well as student name and set a default month if left blank
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return three times"
  name = gets.chomp
  # ask for cohort month
  puts "Please enter the cohort of the student"
  cohort = gets.chomp
  # check for valid spelling of a month
  valid_cohort = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
  # create an empty array
  students = []
  # while the name is not empty, repeat this code
  while !name.empty? do
    # provide a default value for no month of misspelt month
    if cohort.empty?
      cohort = "may"
    elsif !valid_cohort.include?(cohort.downcase)
      cohort = "may"
    end
    # add the student hash to the array
    students << {name: name, cohort: cohort.downcase.to_sym}
    puts "Now we have #{students.count} students"
    name = gets.chomp
    cohort = gets.chomp
    # get another name from the user
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

# Print the list ordered by cohort month (not name)
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return three times"
  name = gets.chomp
  # ask for cohort month
  puts "Please enter the cohort of the student"
  cohort = gets.chomp
  # check for valid spelling of a month
  valid_cohort = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
  # create an empty array
  students = []
  # while the name is not empty, repeat this code
  while !name.empty? do
    # provide a default value for no month of misspelt month
    if cohort.empty?
      cohort = "may"
    elsif !valid_cohort.include?(cohort.downcase)
      cohort = "may"
    end
    # add the student hash to the array
    students << {name: name, cohort: cohort.downcase.to_sym}
    puts "Now we have #{students.count} students"
    name = gets.chomp
    cohort = gets.chomp
    # get another name from the user
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print(students)
  # create a new array of just the cohort info from students
  cohort = []
  #map to iterate over the students array and extract the cohort values from the students array in a new array
  students.map { | student| cohort << student[:cohort] }
  # sort the array alphabetically
  alphabetical_cohort = cohort.sort!
  # remove any duplicates from the cohort array
  current_cohort = alphabetical_cohort.uniq
  # set a counter so that you can iterate through the cohorts array
  current_cohort_index = 0
  # loop over the current_cohort array to print each month for the students.
  while current_cohort_index < current_cohort.length
    puts "Students in the #{current_cohort[current_cohort_index].capitalize} cohort are:".center(50)
        # iterate through the students array
        students.each do |student|
        # find the students for that particular month / value of the current_cohort array.
          if student[:cohort] == current_cohort[current_cohort_index]
            # print their name
             puts student[:name].center(50)
          end
        end
    # increment on on the current_cohort_index in order to move on to the next month.
    current_cohort_index += 1
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

# Correct the message for letting user know number of students so that if one student the statement is singular.
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return three times"
  name = gets.chomp
  # ask for cohort month
  puts "Please enter the cohort of the student"
  cohort = gets.chomp
  # check for valid spelling of a month
  valid_cohort = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
  # create an empty array
  students = []
  # while the name is not empty, repeat this code
  while !name.empty? do
    # provide a default value for no month of misspelt month
    if cohort.empty?
      cohort = "may"
    elsif !valid_cohort.include?(cohort.downcase)
      cohort = "may"
    end
    # add the student hash to the array
    students << {name: name, cohort: cohort.downcase.to_sym}
      if students.count < 2
        puts "Now we have #{students.count} student"
      else puts "Now we have #{students.count} students"
      end
    name = gets.chomp
    cohort = gets.chomp
    # get another name from the user
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

# Remove chomp() and use alternative method for deleting last character of a string
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return three times"
  name = gets.delete "\n"
  # ask for cohort month
  puts "Please enter the cohort of the student"
  cohort = gets.delete "\n"
  # check for valid spelling of a month
  valid_cohort = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
  # create an empty array
  students = []
  # while the name is not empty, repeat this code
  while !name.empty? do
    # provide a default value for no month of misspelt month
    if cohort.empty?
      cohort = "may"
    elsif !valid_cohort.include?(cohort.downcase)
      cohort = "may"
    end
    # add the student hash to the array
    students << {name: name, cohort: cohort.downcase.to_sym}
      if students.count < 2
        puts "Now we have #{students.count} student"
      else puts "Now we have #{students.count} students"
      end
    name = gets.delete "\n"
    cohort = gets.delete "\n"
    # get another name from the user
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
  letter = gets.delete "\n"
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

# What if there is no input from the user?
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return three times"
  name = gets.delete "\n"
  # ask for cohort month
  puts "Please enter the cohort of the student"
  cohort = gets.delete "\n"
  # check for valid spelling of a month
  valid_cohort = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
  # create an empty array
  students = []
  # while the name is not empty, repeat this code
  while !name.empty? do
    # provide a default value for no month of misspelt month
    if cohort.empty?
      cohort = "may"
    elsif !valid_cohort.include?(cohort.downcase)
      cohort = "may"
    end
    # add the student hash to the array
    students << {name: name, cohort: cohort.downcase.to_sym}
      if students.count < 2
        puts "Now we have #{students.count} student"
      else puts "Now we have #{students.count} students"
      end
    name = gets.delete "\n"
    cohort = gets.delete "\n"
    # get another name from the user
  end
  # return the array of students
  students
end

def print_header(students)
  if students.length > 0
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
  end
end

def print(students)
  students_index = 0
  if students.length > students_index
    puts "#{students_index + 1}. #{students[students_index][:name]} (#{students[students_index][:cohort]} cohort)".center(50)
    students_index += 1
  else
    puts "There are no students on the cohort"
  end
end

def print_students_beginning_with(students)
  puts "What letter who you like: "
  letter = gets.delete "\n"
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
  if students.length > 0
  puts "Overall, we have #{students.count} great students".center(50)
  end
end

def interactive_menu
  # 4. Be able to keep repeating from step 1
  loop do
  # 1. print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
  # 2. read the input and save it into a variable
  selection = gets.chomp
  # 3. do what the user has asked
  case selection
  when "1"
    students = input_students
  when "2"
    print_header
    print(students)
  when "9"
    # break / exit
  else
    puts "I don't know what you meant, try again"
  end
  end
end

students = input_students
# nothing happens until we call the methods
print_header(students)
print(students)
print_footer(students)

# Step 9 & 10 - Adding an interactive menu and refactoring
@students = [] #an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice times"
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
      if @students.count < 2
        puts "Now we have #{@students.count} student"
      else puts "Now we have #{@students.count} students"
      end
      # get another name from the user
    name = gets.chomp
  end
end

def interactive_menu
  # declare the students variable outside the loop as if inside it wouldn't be available for all iterations of the loop.
  # students = []
  # 4. Be able to keep repeating from step 1
  loop do
  # 1. print the menu and ask the user what to do
    print_menu
    # 2. read the input and save it into a variable
    # 3. do what the user has asked
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit" # 9 because we'll add more items
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end


def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

interactive_menu
=end
