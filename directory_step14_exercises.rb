=begin
# Before using the CSV library.

@students = [] #an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
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
    menu_selection_process(STDIN.gets.chomp)
  end
end

def menu_selection_process(menu_selection)
  case menu_selection
  when "1"
    puts "You selected - Input the students"
    input_students
  when "2"
    puts "You selected - Show the students"
    show_students
  when "3"
    puts "You selected - Save the list to file"
    puts "Please select a filename:"
    filename = STDIN.gets.chomp
    save_students(filename)
  when "4"
    puts "You selected - Load the list from file"
    puts "Please select a filename:"
    filename = STDIN.gets.chomp
    load_students(filename)
  when "9"
    puts "You selected - Exit"
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
    add_students(name, cohort = "november")
      if @students.count < 2
        puts "Now we have #{@students.count} student"
      else puts "Now we have #{@students.count} students"
      end
      # get another name from the user
    name = STDIN.gets.chomp
  end
end

def show_students
  print_students_header
  print_students_list
  print_students_footer
end

def print_students_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_students_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students(filename = "students.csv")
  # open the file for writing, with a block so don't need to explicitly close the file.
  file = File.open(filename, "w") do |file|
  # iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
end

def load_students(filename = "students.csv")
  # open the file for reading
  file = File.open(filename, "r") do |file|
  # iterate over the contents of the file
    file.readlines.each do |line|
    # split every line at the comma, which gives an array with two elements, assign to the name and cohort variables.
    # this is a parallel assignment (assigning two variables at the same time)
      name, cohort = line.chomp.split(",")
    # put a new hash into the @students array, with the cohort as a symbol for consistency
      add_students(name, cohort)
    end
  # close the file
  end
  # file.close # if you don't use a block to open a file (above)
end

def add_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def try_load_students
  filename = "students.csv" # first arguement from the command line
   # get out of this method if it isn't given
  if File.exists? (filename) #if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry #{filename} doesn't exist."
    return # return so that you can start the programme and mae the CSV if one doesn't already exist
  end
end

try_load_students
interactive_menu
=end

# With the CSV library:
# Have to require the CSV library to use the constant CSV
require 'csv'
@students = [] #an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
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
    menu_selection_process(STDIN.gets.chomp)
  end
end

def menu_selection_process(menu_selection)
  case menu_selection
  when "1"
    puts "You selected - Input the students"
    input_students
  when "2"
    puts "You selected - Show the students"
    show_students
  when "3"
    puts "You selected - Save the list to file"
    puts "Please select a filename:"
    filename = STDIN.gets.chomp
    save_students(filename)
  when "4"
    puts "You selected - Load the list from file"
    puts "Please select a filename:"
    filename = STDIN.gets.chomp
    load_students(filename)
  when "9"
    puts "You selected - Exit"
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
    add_students(name, cohort = "november")
      if @students.count < 2
        puts "Now we have #{@students.count} student"
      else puts "Now we have #{@students.count} students"
      end
      # get another name from the user
    name = STDIN.gets.chomp
  end
end

def show_students
  print_students_header
  print_students_list
  print_students_footer
end

def print_students_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_students_footer
  puts "Overall, we have #{@students.count} great students"
end

# We are de-facto using CSV format to store data. However, Ruby includes a library to work with the CSV files that we could use instead of working directly with the files. Refactor the code to use this library.

def save_students(filename = "students.csv")
  # open the file for writing, with a block so don't need to explicitly close the file.
  CSV.open(filename, "wb") do |csv|
    # for each student in the array
    @students.each do |student|
      # add info to the csv file
      csv << [student[:name], student[:cohort]]
    end
  end
end

def load_students(filename = "students.csv")
  # open the file for reading and iterate over the contents of the file
  CSV.foreach(filename) do |row|
    # split every line at the comma, which gives an array with two elements, assign to the name and cohort variables.
    # this is a parallel assignment (assigning two variables at the same time)
      name, cohort = row[0], row [1]
    # put a new hash into the @students array, with the cohort as a symbol for consistency
      add_students(name, cohort)
  end
end

def add_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def try_load_students
  filename = "students.csv" # first arguement from the command line
   # get out of this method if it isn't given
  if File.exists? (filename) #if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry #{filename} doesn't exist."
    return # return so that you can start the programme and mae the CSV if one doesn't already exist
  end
end

def print_source_code
  # Tell the user the file you're going to print for.
  puts "Printing code for #{$0}:"
  # Create a variable of the file and open it with a block
  source_code = File.open($0, "r") do |file|
    # read each line
    file.readlines
  end
  # print the file
  puts source_code
end

# print_source_code
# try_load_students
interactive_menu
