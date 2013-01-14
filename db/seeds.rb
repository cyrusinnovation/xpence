# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#create employees 
emp = Employee.create(:name=> 'bruce eckfeldt')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'rex madden')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'debbie madden')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'daniel wellman')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'paul blair')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'moss collum')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'matthew raibert')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'jason reid')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'daniel ramteke')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'jesse chen')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'paul infield-harm')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'matthew salerno', :admin=> true, :email=> 'msalerno@cyrusinnovation.com')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'jim stewart')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'nick harsh')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'oliver stewart')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'aldric giacomoni')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'jeremy leakakos')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'conrad benham')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'eric jones')
puts "Created #{emp.name}"
emp = Employee.create(:name=> "jacob o'donnell")
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'sean west')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'jason berry')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'sam gottfried')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'robert smith')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'marc rosenberg')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'nicholas goodwin')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'matthew fowler')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'jonathan drew')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'vitaliy a zakharov')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'bob nadler', :admin=> true, :email=> 'bnadler@cyrusinnovation.com')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'jeremy j fine')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'steven nunez')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'stuart childs')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'paul nikonowicz')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'david a black')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'elizabeth brown')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'najati imam')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'coleman parker')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'michael denomy')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'katherine elkin')
puts "Created #{emp.name}"
emp = Employee.create(:name=> 'laura dean')
puts "Created #{emp.name}"
puts "Created #{Employee.count} employees"
