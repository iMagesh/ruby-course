class MyContacts
  #attr_accessor :name, :email, :phone
  attr_reader :name
  attr_writer :name

  def initialize(name, email, phone)
    @name = name
    @email = email
    @phone = phone
  end

  # def name
  #   @name
  # end

  # def name=(name)
  #   @name = name
  # end

  def send_email
    puts "Email sent to #{@name}"
  end

  def make_call
    puts "Calling #{@name} #{@phone}"
  end

  def email_domain
    match = @email.gsub(/.+@([^.]+).+/, '\1')
    puts match
  end
end

obj = MyContacts.new("Magesh", "pingmagesh@gmail.com", "9952035484")
obj.name = "Raghu"
puts obj.name