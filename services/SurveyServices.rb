require "./models/init.rb"
class SurveyServices
    def self.newSurvey(name)
        @survey = Survey.new(username: name)
        if @survey.save
            [201, { 'Location' => "surveys/#{@survey.id}" }, 'User created sucesfully'] 
            @questions = Question.all
            return @survey, @questions
        else
            return ArgumentError
        end
    end

    def self.getAllSurveys()
        @surveys = Survey.all
    end

    def self.career_obtained(survey) # rubocop:todo Metrics/AbcSize, Metrics/MethodLength
        careersPoints = [] # rubocop:todo Layout/IndentationWidth, Naming/VariableName
  
        Career.all.each do |career|
          careersPoints.push({ 'career' => career.id, 'points' => 0 }) # rubocop:todo Naming/VariableName
        end
  
        choicesUser = survey.responses.map(&:choice_id) # rubocop:todo Naming/VariableName
  
        # Filtra las choices de Outcome, tal que estas choices son de las responses del user
        choices = Outcome.all.filter{ |elem| choicesUser.include? elem.choice_id} # rubocop:todo Naming/VariableName
  
        choices.each do |c|
            # rubocop:todo Naming/VariableName
            idx = careersPoints.index{ |elem| elem['career'] == c.career_id} # rubocop:todo Layout/IndentationWidth, Naming/VariableName
            # rubocop:enable Naming/VariableName
            if idx
                careersPoints[idx]['points'] += 1 # rubocop:todo Layout/IndentationWidth, Naming/VariableName
            end
        end
  
        # rubocop:todo Naming/VariableName
        careerWithMaxPoints = careersPoints.max_by{ |elem| elem['points']} # rubocop:todo Lint/UselessAssignment, Naming/VariableName
      # rubocop:enable Naming/VariableName
    end

    def self.responses(survey_id,choice_id)
        survey = Survey.find(id: survey_id)
        choice_id.each_with_index do |choice , i|
            response = Response.new(question_id: i+1, survey_id: survey.id, choice_id: choice)
            response.save
        end
        careerWithMaxPoints = self.career_obtained(survey)

        career_id = careerWithMaxPoints["career"]
        Finished_Survey.create(career_id: career_id)
        career = Career.find(id: career_id).name
        pointsTotal = careerWithMaxPoints["points"]
            
        survey.update career_id: career_id
        
        return career, pointsTotal
    end

end