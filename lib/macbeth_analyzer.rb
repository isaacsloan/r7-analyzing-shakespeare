require 'open-uri'
require 'nokogiri'

doc = Nokogiri::HTML(open("http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml"))


doc.xpath("//SPEECH").each do |node|
  puts node
end
#   @all_character_instances << node.to_s.gsub(/<(.*?)>/, "")
#   @characters.add(node.to_s.gsub(/<(.*?)>/, ""))
# end
# # 
# @final_array = Hash.new
# 
# @characters.each do |c|
#   @final_array[c] = @all_character_instances.count(c)
# end
# 
# @final_array.sort_by {|k, v| v}.reverse.each do |key, value|
#   puts "#{value} #{key.capitalize}"
# end
