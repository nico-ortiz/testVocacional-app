Sequel.migration do 
    up do
        alter_table(:careers) do
            rename_column :career_id, :id
        end
        alter_table(:choices) do
            rename_column :id_choice,   :id
            rename_column :id_question, :question_id
        end
        alter_table(:outcomes) do
            rename_column :id_outcome, :id
            rename_column :id_choice,  :choice_id
        end
        alter_table(:questions) do
            rename_column :id_question, :id
        end
        alter_table(:responses) do
            rename_column :id_response, :id
            rename_column :id_question, :question_id
            rename_column :id_survey,   :survey_id
            rename_column :id_choice,   :choice_id
        end
        alter_table(:surveys) do
            rename_column :id_survey, :id
            rename_column :name ,     :username
        end
    end
end