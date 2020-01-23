require 'pry'
require 'rubygems'
require 'nokogiri'
require 'open-uri'

def crypto_scrapper
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

	results = Array.new
	array_name = Array.new 
	array_value = Array.new 

	name_currency = page.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody/tr[*]/td[3]/div') #name of each currencies (first 200)
	name_currency.each do |name_currency| 
		array_name << name_currency.text
	end

	value_currency = page.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody/tr[*]/td[5]/a') #values of each currencies (first 200)
	value_currency.each do |value_currency| 
		array_value << value_currency.text
	end
	array_value.map! { |i| i.gsub(/[$,]/,"").to_f}

	x = array_name.length - 1 #results
	for i in (0..x)
		results << { array_name[i] => array_value[i] }
	end
	return results
end


#add "cryto-scrapper" to start the programm
	