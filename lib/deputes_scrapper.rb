require 'pry'
require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_deputes_emails(depute_url) #get the email of one depute
	page = Nokogiri::HTML(open(depute_url))
	depute_email = page.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[2]/a')
	return depute_email.text
end

def deputes_informations
	page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
	
	array_deputes_names = []
	array_deputes_url = []
	results = []

	depute_name = page.xpath('//*[@id="deputes-list"]/div[1]/ul[1]/li[*]/a') #get the names of 10 deputies 
	depute_name.each do |depute_name|
		array_deputes_names << depute_name.text.split[1..-1].join(" ")
	end

	depute_url = page.xpath('//*[@id="deputes-list"]/div[1]/ul[1]/li[*]/a/@href') #get the url of 10 deputies 
	depute_url.each do |depute_url|
		array_deputes_url << depute_url.text
	end
	array_deputes_url.map!{|i| "http://www2.assemblee-nationale.fr"+i}
	
	x = array_deputes_names.length - 1 #results
	for i in (0..x)
		results << {
			"first_name" => array_deputes_names[i].split[0], 
			"last_name" => array_deputes_names[i].split[1], 
			"email" => get_deputes_emails(array_deputes_url[i])}
	end
	return results
end

#add "deputes_informations" to start the programm