class Person
	def initialize(name, age)
		@nickname = name[0..3]
		@name = name
		@age = age.to_i
	end

	def introduce()
		return "Hi, my name is #{@name} and I'm #{@age} years old."
	end

	def birth_year()
		return 2015 - @age
	end

	def nickname()
		return @nickname
	end
end
