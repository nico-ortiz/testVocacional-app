require "./models/init.rb"
class CareerServices
    def self.newSurvey(name)
        @survey = Survey.new(username: name)
        if @survey.save
            [201, { 'Location' => "surveys/#{@survey.id}" }, 'User created sucesfully'] 
            @questions = Question.all
        else
            return ArgumentError
        end
    end
end