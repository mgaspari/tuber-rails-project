class Video < ActiveRecord::Base
  attr_accessor :transcript

  has_many :groups_videos
  has_many :groups, through: :groups_videos
  has_many :videos_terms
  has_many :terms, through: :videos_terms
  has_many :notes

  def plug_in_data

  end

  def parse_transcript
    @transcript.split("\n").join(" ").scan(/(?<time>\d?\d?\d+\d+\:\d+\d+) (?<words>\D+)/)

  end

  # def scraper(link)
  #   page = Nokogiri::HTML(open("#{link}"))
  # end

def get_data(link)
  driver = Selenium::WebDriver.for :chrome
  driver.navigate.to "#{link}"
  sleep(4.5)
  element = driver.find_element(id: 'buttons')
  a = element.find_element(:xpath=>"//button[@aria-label='More actions']")
  a.click
  b = a.find_element(:xpath=>"//iron-dropdown")
  b.click
  sleep(1.5)
  c = b.find_element(:xpath=>"//paper-menu")
  d = c.find_element(:xpath=>"//ytd-transcript-body-renderer")
  @transcript = d.text
  driver.quit
end


end
