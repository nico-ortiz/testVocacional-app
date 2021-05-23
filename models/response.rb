class Response < Sequel::Model
    many_to_one :question
    many_to_one :survey
    many_to_one :choice

    plugin :validation_helpers
    def validate
        super
            validates_presence [:question_id, :survey_id, :choice_id]
    end
end
