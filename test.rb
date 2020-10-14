class User
  attr_accessor :name, :age, :email
end

def ask_user_info
  1.upto(10) do
    @user = User.new
    validate_name
    validate_age
    validate_email
    @users << @user
    puts "#{@user.name} is added to the collection of users."
  end
end

def is_string?(obj)
  /([a-zA-Z]+)/.match(obj)
end

def is_number?(obj)
  obj = obj.to_s unless obj.is_a? String
  /\A[+-]?\d+(\.[\d]+)?\z/.match(obj)
end

def is_email?(obj)
  /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.match(obj)
end

def validate_age
  print 'Enter user\'s age: '
  age = nil
  loop do
    age = gets.chomp
    if is_number?(age)
      @user.age = age
      break
    end
    print "That is not a valid age. Try again: "
  end
end

def validate_name
  print 'Enter user\'s name: '
  name = nil
  loop do
    name = gets.chomp.capitalize
    if is_string?(name)
      @user.name = name
      break
    end
    print "That is not a valid name. Try again: "
  end
end

def validate_email
  print 'Enter user\'s email: '
  email = nil
  loop do
    email = gets.chomp
    if is_email?(email)
      @user.email = email
      break
    end
    print "That is not a valid email. Try again: "
  end
end

def list_users
  puts "\n" + "Users listing" + "\n" + "Name" + " | " + "Age" + " | " + "Email"
  @users.each { |certain_user| puts "#{certain_user.name} | #{certain_user.age} | #{certain_user.email}\n" }
end

@users = Array.new
ask_user_info
list_users
