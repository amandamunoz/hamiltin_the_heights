# scrapes an entire album's lyrics from songlyrics.com

require 'rubygems'
require 'nokogiri'
require 'open-uri'

puts "* * * * * Getting track URL's... * * * * * "

index_url = "http://www.songlyrics.com/original-broadway-cast/in-the-heights/"
index_page = Nokogiri::HTML(open(index_url))
tracks = index_page.css('table.tracklist tr')

track_urls = []

tracks[0..20].each do |track|
  track_urls << track.css('td a').map{ |a| a['href'] }
end

track_urls.flatten!

count = 0
File.open('in_the_heights.txt', 'w') do |file|
  track_urls.each do |track_url|
    count += 1
    puts "Scraping track #{count} of #{track_urls.count} * * * * *"

    track_page = Nokogiri::HTML(open(track_url))
    file.puts track_page.css("p#songLyricsDiv").to_s.gsub('<br>', '')
  end
  puts 'Closing file'
  file.close
end

