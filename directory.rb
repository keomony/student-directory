#set months as global variable as it is needed in different methods
#months of the year are always the same, there's no modification on the varialbe and its values
$months = ['January','Feburary','March','April','May','June','July','August','September','November','December']
#input students info from the user and do some validations
def input_students
  puts "To finish, just hit return twice"
  puts "Please enter the names of the students"
  puts "Name:"
  # create an empty array
  students = []
  #get the first name
  name = gets.chomp

  #while the name is not empty, repeat this code
  while !name.empty? do
    puts "Cohort:"
    cohort = gets.chomp
    #validate cohort input if it's empty or not match with the existing cohort (considered it as typo)
    #, print out Typo to let the user know
    if (cohort.to_s.empty?) || ($months.select{|m| m.downcase == cohort.downcase}.empty?) == true
        puts "Typo"
    else
        puts "Hobbies:"
        #get hobbies, country of birth, height
        hobbies = gets.chomp
        puts "Country of birth:"
        country = gets.chomp
        puts "Height:"
        height = gets.chomp
        #add the student hash to the array
        students << {name: name, cohort: cohort.capitalize.to_sym, hobbies: hobbies, country: country, height: height}
        if students.length == 1
          puts "Now we have #{students.count} student"
        else
          puts "Now we have #{students.count} students"
        end
        #get another name from the user
        puts "Name:"
        name = gets.chomp
    end
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-".* 70
end

def print(students)
  students.each_with_index do |student,i|
    puts "#{i+1}.#{student[:name]} (#{student[:cohort]} cohort) (#{student[:hobbies]} hobbies) (#{student[:country]} country) (#{student[:height]} height)".center(50)
  end
end

#print the students whose name begins with a specific letter
def print_name_begins_with(students, a_letter)
  puts "Students whose names begin with #{a_letter}".center(50)
  #array index starts from 0
  j = 0
  #iterator starts from 1
  i = 1
  begin
    if students[j][:name].chars.first.downcase == a_letter.downcase
      puts "#{i}.#{students[j][:name]} (#{students[j][:cohort]} cohort)".center(50)
      i +=1
    end
    j += 1
  end while j< students.length #while loops as long as the condition is true
  #if no name matched the condition
  if i < 2
    puts "There's no student whose name beings with #{a_letter}".center(50)
  end
end

#print students whose names are shorter than 12 characters
def print_name_shorter_than(students, num)
  puts "Students whose names are shorter than #{num} characters".center(50)
  #array index starts from 0
  j = 0
  #iterator starts from 1
  i = 1
  begin
    if students[j][:name].length < num
      puts "#{i}.#{students[j][:name]}, #{students[j][:name].length} (#{students[j][:cohort]} cohort)".center(50)
      i += 1
    end
    j +=1
  end until j > students.length - 1 #until loops as long as the condition is false
  #if no name matched the condition
  if i < 2
    puts "There's no student whose name is shorter than #{num}".center(50)
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students.".center(50)
end
lines = 100
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
#print the list of all students whose names begin with 'k'
puts "-".* 70
print_name_begins_with(students, 'k')

#print students whose names are shorter than 12 characters
puts "-".* 70
print_name_shorter_than(students, 12)
