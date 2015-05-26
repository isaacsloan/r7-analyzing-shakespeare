people = Hash.new(3) 
(1..10).each do |i|
  people[i.to_s] += i
end

puts people.inspect
