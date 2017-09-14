class Video < ActiveRecord::Base
  attr_accessor :transcript

  has_many :groups_videos
  has_many :groups, through: :groups_videos
  has_many :videos_terms
  has_many :terms, through: :videos_terms
  has_many :notes

  def parse_transcript
    @transcript.split("\n").join(" ").scan(/(?<time>\d?\d?\d+\d+\:\d+\d+) (?<words>\D+)/)
  end

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

  def seconds_to_time(seconds)
    mm, ss = seconds.divmod(60)
    hh, mm = mm.divmod(60)
    "#{hh}:#{mm}:#{ss}"
  end

  def time_to_seconds(time)
    time.split(':').map { |a| a.to_i }.inject(0) { |a, b| a * 60 + b}.to_s
  end


end
