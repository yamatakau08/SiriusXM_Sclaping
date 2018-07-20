#! /usr/bin/env ruby
# coding: utf-8

require 'pp'
require 'selenium-webdriver'
require 'nokogiri'

ENV['no_proxy'] = '127.0.0.1' # selenium need to set 'no_proxy'
ENV.delete("HTTP_PROXY")      # to suppress the message on fish shell "The environment variable HTTP_PROXY is discouraged.  Use http_proxy."

url   = 'http://www.siriusxm.com' # Top Page

driver = Selenium::WebDriver.for :chrome

stime   = 60 * 100 # stime: sleep time unit sec

timeout = 15
wait = Selenium::WebDriver::Wait.new(:timeout => timeout)
# refer http://www.seleniumqref.com/api/ruby/time_set/Ruby_implicit_wait.html
driver.manage.timeouts.implicit_wait = timeout

driver.get(url)

# url: https://www.siriusxm.com

# click "Listen Online"
item_str = "Listen & Watch or Listen Online"
puts "[CHECK] \"#{item_str}\""
xpath = '//*[@id="sxm-header"]/nav[2]/ul/li[1]/a'
item  = driver.find_element(:xpath, xpath)
if item
  puts "[INFO] \"#{item_str}\" found"
  puts "[INFO] \"#{item_str}\" click"
  item.click
  puts "[INFO] \"#{item_str}\" clicked"
else
  puts "[ERROR] \"#{item_str}\" not found"
  sleep stime
end

# url: https://player.siriusxm.com/welcome
# click "Watch and Listen Now"
item_str = "Watch and Listen Now"
puts "[CHECK] \"#{item_str}\""
cname = "get-started-button__text"
item  = driver.find_element(:class, cname)
if item
  puts "[INFO] \"#{item_str}\" found"
  puts "[INFO] \"#{item_str}\" click"
  #  item.click
  puts "[INFO] \"#{item_str}\" clicked"
else
  puts "[ERROR] \"#{item_str}\" not found"
  sleep stime
end

sleep stime