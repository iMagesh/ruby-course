class Settings

  @settings = {}
  def self.all
    @settings
  end

  def self.[](key)
    all[key]
  end

  def self.[]=(key, value)
    all[key] = value
  end

end

Settings[:secret] = 42 * Math::PI * Time.now.to_f
p Settings[:secret]

# class Settings

#   def Settings.all; end

#   # or
#   class << self
#     def all; end
#   end

# end
