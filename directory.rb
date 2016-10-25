def input_students
  puts "To finish, just hit return twice"
  puts "Please enter the names of the students"
  puts "Name:"
  # create an empty array
  students = []
  month = ['January','Feburary','March','April','May','June','July','August','September','November','December']
  #get the first name
  name = gets.chomp

  #while the name is not empty, repeat this code
  while !name.empty? do
    puts "Cohort:"
    cohort = gets.chomp
    if (cohort.to_s.empty?) || (month.select{|m| m.downcase == cohort.downcase}.empty?) == true
        puts "Typo"
        #puts "Cohort:"
        #cohort = gets.chomp
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
          #get another name from the user
          puts "Name:"
          name = gets.chomp
        else
          puts "Now we have #{students.count} students"
          #get another name from the user
          puts "Name:"
          name = gets.chomp
        end
    end
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-".* 20
end

def print(students)
  students.each_with_index do |student,i|
    puts "#{i+1}.#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

#print the students whose name begins with a specific letter
def print_name_begins_with(students, a_letter)
  puts "Students whose names begin with #{a_letter}"
  #array index starts from 0
  j = 0
  #iterator starts from 1
  i = 1
  begin
    if students[j][:name].chars.first.downcase == a_letter.downcase
      puts "#{i}.#{students[j][:name]} (#{students[j][:cohort]} cohort)"
      i +=1
    end
    j += 1
  end while j< students.length #while loops as long as the condition is true
  #if no name matched the condition
  if i < 2
    puts "There's no student whose name beings with #{a_letter}"
  end
end


#print students whose names are shorter than 12 characters
def print_name_shorter_than(students, num)
  puts "Students whose names are shorter than #{num} characters"
  #array index starts from 0
  j = 0
  #iterator starts from 1
  i = 1
  begin
    if students[j][:name].length < num
      puts "#{i}.#{students[j][:name]}, #{students[j][:name].length} (#{students[j][:cohort]} cohort)"
      i += 1
    end
    j +=1
  end until j > students.length - 1 #until loops as long as the condition is false
  #if no name matched the condition
  if i < 2
    puts "There's no student whose name is shorter than #{num}"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end

#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
#print the list of all students whose names begin with 'k'
puts "-".* 20
print_name_begins_with(students, 'k')

#print students whose names are shorter than 12 characters
puts "-".* 20
print_name_shorter_than(students, 12)
