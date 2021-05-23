require_relative '../config/environment.rb'
require 'open-uri'
require 'nokogiri'
require 'pry'
class Scraper
    url = 'https://ruby-doc.org/core-2.5.3/Method.html'

    def self.scrape_index_page(url)
      binding.pry
        index_page = Nokogiri::HTML(open(url))
        events = []
#        index_page.css("eADW5d").each do |cell|
#          cell.css("presentation").each do |pres|
#            pres.css("c1w3e").each do |event|
#                event.css("ynRLnc").each do |event_desc|
#                    event_name = event_desc.css[1].text.strip
#                    event_time = event_desc.css[0].text.strip
#                    event_date = DateTime.parse(event_desc[5].text.strip)
#                    event_location = event_desc.css[4].text.strip
#                    event_status = event_desc.css[3].text.strip

#          events << {name: event_name, time: event_time, date: event_date, location: event_location, status: event_status}
#          end
#        end
#        events
#      end
    end
end

#@name = name
#@time = time
#@date = date
#@people = people
#@location = location
#@status = status


#def self.scrape_index_page(url)
#    index_page = Nokogiri::HTML(open(url))
#    events = []
#    binding.pry
#        index_page.css("eADW5d").each do |cell|
#          cell.css("presentation").each do |pres|
#            pres.css("c1w3e").each do |event|
#                event.css("ynRLnc").each do |event_desc|
#                    event_name = event_desc.css[1].text.strip
#                    event_time = event_desc.css[0].text.strip
#                    event_date = DateTime.parse(event_desc[5].text.strip)
#                    event_location = event_desc.css[4].text.strip
#                    event_status = event_desc.css[3].text.strip

#          events << {name: event_name, time: event_time, date: event_date, location: event_location, status: event_status}
#          end
#        end
#        events
#      end
#end
#end