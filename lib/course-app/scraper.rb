
# require_relative './course.rb'

class CourseApp::Scraper
  BASE_URL = "https://academyxi.com"

  def get_page(url = BASE_URL)
    uri = URI.parse(url)
    Nokogiri::HTML(uri.open)
  end

  def get_courses
    doc = get_page
    puts "Loading courses"

    #scrape all the courses 
    courses = doc.css('div.list-entry').map do |course|
      print "="
      title = course.css('h4.entry-title').text.strip
      summary = course.css('div.entry-desc').text.strip
      url = course.css('a').attr("href").value.strip  
      content =  get_course_content url
      {title: title, summary: summary, url: url, content: content}
    end

    make_courses courses
  end

  def get_course_content(url)
    course_url = url.include?(BASE_URL) ? url : "#{BASE_URL}#{url}"
    doc = get_page(course_url)

    doc.css('div.elementor-text-editor').text.strip
  end

  def make_courses courses
    courses.map {|course| CourseApp::Course.new course}
  end
end