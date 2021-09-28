class CourseApp::Course
  attr_accessor :title, :summary, :content, :url
  @@all = []

  def initialize title:, summary:, url:, content:
    @title = title
    @summary = summary
    @url = url
    @content = content

    @@all << self
  end

  def print
    system("clear")
    puts ""
    puts "==============================="
    puts "Course Title: #{title}"
    puts "==============================="
    puts ""
    puts "url: #{url}"
    puts "Summary:"
    puts summary
    puts ""
    puts "==============================="
    puts ""
    puts "Content:"
    puts content
    puts ""
    puts "==============================="
  end

  def self.all
    @@all
  end
end