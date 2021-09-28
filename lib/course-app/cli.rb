
class CourseApp::CLI

  def initialize
    CourseApp::Scraper.new.get_courses  
  end

  def start
    system("clear")
    puts "Welcome to my Course CLI App"
    new_line
    puts "Do you want to view the available courses?"
    puts "Input [y] for YES"
    puts "Enter any character to EXIT"
    
    input = gets.strip.downcase
    input == "y" ? list_courses : exit
  end

  def list_courses
    system("clear")
    puts "Courses Available:"
    new_line
    print_divider

    CourseApp::Course.all.each.with_index(1) do |course, i|
      puts "#{i}. #{course.title}"
    end

    prompt_course_selection
  end

  def print_divider
    puts "================================================="
  end

  def new_line
    puts ""
  end

  def prompt_course_selection
    new_line
    print_divider
    puts "Please enter the number of the course to view more details:"
    puts "Input any character to exit"
    
    input = get_user_input
    input == 0 ? exit : print_course_details(input)
  end

  def get_user_input
    input = gets.strip.to_i

    if input > CourseApp::Course.all.size
      puts "Invalid input: number is greater than the number  of courses available."
      puts "Please input a valid number."
      return get_user_input
    end

    input 
  end


  def print_course_details input
    CourseApp::Course.all[input - 1].print
    prompt_user_general
  end

  def prompt_user_general
    new_line
    print_divider
    puts "Input [list] to view the list of courses"
    puts "Input any character to exit"

    input = gets.strip.downcase

    input == "list" ? list_courses : exit
  end
end