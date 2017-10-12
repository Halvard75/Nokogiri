#! /usr/bin/env ruby

require 'nokogiri'
require 'open-uri'


doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/hauts-de-seine.html').read)

puts "### Search for nodes by css"
urls = doc.search('a.lientxt').map { |tag|
  case tag.name.downcase
  when 'a'
    tag['href']
  end
  }
  puts "http://annuaire-des-mairies.com/hauts-de-seine.html/ + #{urls}\n"

=begin
# Fetch and parse HTML document
doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/92/sceaux.html'))

puts "### Search for nodes by css"
doc.css('p:contains("@")').each do |link|
  puts link.content
end
=end
