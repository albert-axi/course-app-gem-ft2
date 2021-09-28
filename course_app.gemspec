Gem::Specification.new do |s|
  s.name        = 'course-app'
  s.version     = '0.0.0'
  s.summary     = "Sample Gem!"
  s.description = "A simple course app"
  s.authors     = ["Albert Palada"]
  s.email       = 'albert@academyxi.com'
  s.files       = [
    "lib/course_app.rb",
    "lib/course-app/scraper.rb",
    "lib/course-app/course.rb",
    "lib/course-app/cli.rb"
  ]
  s.executables << 'course_app'
  s.homepage    =
    'https://rubygems.org/gems/course-app'
  s.license       = 'MIT'
end