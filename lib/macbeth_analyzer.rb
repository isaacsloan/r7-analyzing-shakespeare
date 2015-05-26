require 'nori'
require 'nokogiri'
require 'net/http'

xml = Net::HTTP.get('www.ibiblio.org', '/xml/examples/shakespeare/macbeth.xml')
hash = Nori.new(:parser => :nokogiri, :advanced_typecasting => false, 
                :convert_tags_to => lambda { |tag| tag.snakecase.to_sym }).parse(xml)
people = hash[:play][:act].inject(Hash.new(0)) do |people, act|
  act[:scene].each do |scene|
    scene[:speech].each do |speech|
      people[speech[:speaker]] += (speech[:line].is_a?(Array) ? speech[:line].size : 1)
    end
  end
  people
end

puts people.sort_by{|name, lines| lines}.reverse.map{|name, lines| "#{name}: #{lines}"}
