class MyContacts
  attr_accessor :name, :email, :phone

  def initialize(name, email, phone)
    @name = name
    @email = email
    @phone = phone
  end

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

magesh = MyContacts.new("Magesh", "pingmagesh@gmail.com", "9952035484")
puts magesh.email_domain