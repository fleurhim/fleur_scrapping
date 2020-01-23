require 'pry'
require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_townhall_email(townhall_url) #get the email of one townhall
	page = Nokogiri::HTML(open(townhall_url))
	townhall_email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
	return townhall_email.text
end

def get_townhall_urls

	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

	towns_name = []
	urls_towns = []
	results = []

	town_name = page.xpath("//tr/td[*]/p/a") #get the names of each cities
	town_name.each do |town_name|
		towns_name << town_name.text
	end

	town_url = page.xpath("//tr/td[*]/p/a/@href") #get the URL of each cities
	town_url.each do |town_url|
		urls_towns << town_url.text
	end
	urls_towns.map!{|i| "http://annuaire-des-mairies.com"+i.sub(/[.]/,"")}

	i = 1 #results
	for i in 1..towns_name.length-1
		results << {towns_name[i] => get_townhall_email(urls_towns[i])}
	end
	return results
end 

#add "get_townhall_urls" to start the programm

