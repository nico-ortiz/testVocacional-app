#Clean Dataset
Survey.all.map{|survey| survey.destroy}
Career.all.map{|career| career.destroy}

#Create Careers
career = Career.create(name: 'Economia')

#Create Surveys
Survey.create(username: 'Nicolas', career: career )