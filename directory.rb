def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
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
  #iterator starts from 1
  i = 1
  students.each do |student|
    if student[:name].chars.first.downcase == a_letter.downcase
      puts "#{i}.#{student[:name]} (#{student[:cohort]} cohort)"
      i += 1
    end
  end
  #if no name matched
  if i < 2
    puts "There's no student whose name beings with #{a_letter}"
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
