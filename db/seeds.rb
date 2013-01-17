# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Employee.destroy_all

nonadminnames = [
  'bruce eckfeldt',
  'rex madden',
  'debbie madden',
  'daniel wellman',
  'paul blair',
  'moss collum',
  'matthew raibert',
  'jason reid',
  'daniel ramteke',
  'jesse chen',
  'paul infield-harm',
  'jim stewart',
  'nick harsh',
  'oliver stewart',
  'aldric giacomoni',
  'jeremy leakakos',
  'conrad benham',
  'eric jones',
  "jacob o'donnell",
  'sean west',
  'jason berry',
  'sam gottfried',
  'marc rosenberg',
  'nicholas goodwin',
  'matthew fowler',
  'jonathan drew',
  'vitaliy a zakharov',
  'jeremy j fine',
  'steven nunez',
  'stuart childs',
  'paul nikonowicz',
  'david a black',
  'elizabeth brown',
  'najati imam',
  'michael denomy',
  'katherine elkin',
  'laura dean'
]

adminnames = [
  'matthew salerno',
  'bob nadler',
  'coleman parker',
  'robert smith'
]

def make_email(name)
    names = name.split(' ')
    firstinit = names.first[0]
    lastname = names.last.gsub("'", "")
    firstinit + lastname + "@cyrusinnovation.com"
end
def create_employees(names)
  names.each do |name|
    email = make_email(name)
    Employee.create(:name => name, :email => email)
    puts "Created #{name} with #{email}"
  end
end

def create_admin_employees(names)
  names.each do |name|
    email = make_email(name)
    Employee.create(:name => name, :email => email, :admin => true)
    puts "Created #{name} with #{email} as admin"
  end
end

create_employees(nonadminnames)
create_admin_employees(adminnames)
