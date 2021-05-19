Sequel.migration do
    up do
        alter_table(:responses) do
            add_foreign_key :id_question, :questions
            add_foreign_key :id_survey, :surveys
            add_foreign_key :id_choice, :choices
        end
    end

    down do
        alter_table(:responses)do
            drop_foreign_key :id_question
            drop_foreign_key :id_survey
            drop_foreign_key :id_choice
        end
    end
end