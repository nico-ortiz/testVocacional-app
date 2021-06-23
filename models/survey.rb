class Survey < Sequel::Model
    many_to_one :career
    one_to_many :responses

    plugin :validation_helpers
    def validate
    	super
         validates_presence [:username]
  	end

    
    def career_obtained (survey)

        careersPoints = []

        for career in Career.all 
          careersPoints.push({"career" => career.id, "points" => 0})
        end

        choicesUser = survey.responses.map{ |elem| elem.choice_id }

        #Filtra las choices de Outcome, tal que estas choices son de las responses del user
        choices = Outcome.all.filter{ |elem| choicesUser.include? elem.choice_id}

        for c in choices
            idx = careersPoints.index{ |elem| elem["career"] == c.career_id}
            if(idx)
                careersPoints[idx]["points"] += 1
            end
        end

        careerWithMaxPoints = careersPoints.max_by{ |elem| elem["points"]}
    end
end