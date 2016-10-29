# read the current executed file
#   get the file name
#   open it with readonly
# print the content of the file out
#   puts line by line to the screen
file = File.open($0,"r")
while !file.eof
  puts file.readline
end
file.close
