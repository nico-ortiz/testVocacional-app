Sequel.migration do
    up do
        alter_table(:choices) do
            add_foreign_key :id_question, :questions
           
        end
    end

    down do
        alter_table(:choices)do
            drop_foreign_key :id_question
          
        end
    end
end