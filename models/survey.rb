# frozen_string_literal: true

class Survey < Sequel::Model # rubocop:todo Style/Documentation
  many_to_one :career
  one_to_many :responses

  plugin :validation_helpers
  def validate
      super # rubocop:todo Layout/IndentationWidth
      validates_presence [:username]
  end

  def career_obtained(survey) # rubocop:todo Metrics/AbcSize, Metrics/MethodLength
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
end
