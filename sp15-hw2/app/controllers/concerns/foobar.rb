class Foobar
	def self.baz(array)
		return array.map! {|x| x.to_i}.map! {|x| x += 2}.keep_if {|x| x % 2 == 0}.keep_if {|x| x <= 10}.uniq.reduce :+
	end
end