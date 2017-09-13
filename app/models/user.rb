require 'rubygems'
require 'nokogiri'
require 'open-uri'


class User < ApplicationRecord
  has_many :groups
  has_many :groups_videos, through: :groups
  has_many :videos, through: :groups_videos
  has_many :notes, through: :videos
  has_many :videos_terms, through: :videos
  has_many :terms, through: :videos_terms


  def scraper
    page = Nokogiri::HTML(open("https://www.youtube.com/watch?v=FOt1dwWRLGk"))
    binding.byebug
  end

def get_data

  Selenium

  driver = Selenium::WebDriver.for :chrome
  driver.navigate.to "https://www.youtube.com/watch?v=BLB2Mrvh44A"

  element = driver.find_element(id: 'buttons')

  a = element.find_element(:xpath=>"//button[@aria-label='More actions']")
  a.click
  b = a.find_element(:xpath=>"//iron-dropdown")
  b.click
  c = b.find_element(:xpath=>"//paper-menu")
  d = c.find_element(:xpath=>"//ytd-transcript-body-renderer")
  # all script



  banana.find_element(:xpath=>"//div[@class='cue-group style-scope ytd-transcript-body-renderer']")
  # individual script

end
#
# .find_element(:xpath=>"//ytd-menu-service-item-renderer")





end
