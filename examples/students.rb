class Student
  attr_accessor :name, :gpa

  def initialize(name, gpa)
    @name = name
    @gpa = gpa
  end

  def honor_roll?
    gpa >= 3.5
  end
end

students = [
  Student.new('Jeff Winger', 3.0),
  Student.new('Britta Perry', 3.0),
  Student.new('Annie Edison', 4.0),
  Student.new('Troy Barnes', 3.2),
  Student.new('Abed Nadir', 3.5),
  Student.new('Shirley Bennett', 3.4)
]

puts "STUDENTS", "========"
puts "Name\t\tGPA\tHonor Roll", "----\t\t---\t----------"

students.each do |student|
  puts "#{student.name}\t#{student.gpa}\t#{student.honor_roll?}"
end
