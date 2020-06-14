require 'xcodeproj'

project_path = '/Users/channyeinthaw/Documents/Lab/pagewerkz-reader-ios/GlobalEdu.xcodeproj'
project = Xcodeproj::Project.open(project_path)

global_edu_gp = (project.groups.filter { |group| group.display_name == 'GlobalEdu' })[0]
puts global_edu_gp.real_path

test_gp = global_edu_gp.new_group('testGp', "#{global_edu_gp.real_path}/testGp")
test_gp.new_file("test.swift")
# project.groups.each do |group|
#   puts group.display_name
#   # group.new_file("file.swift")
#   testGp = group.new_group("testGp", "/Users/channyeinthaw/Documents/Lab/pagewerkz-reader-ios/GlobalEdu")
#   testGp.new_file("file.swift")
# end
#
project.save
