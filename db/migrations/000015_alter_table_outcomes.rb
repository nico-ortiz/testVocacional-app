Sequel.migration do
    up do
        alter_table(:outcomes) do
            add_foreign_key :id_career, :careers
            add_foreign_key :id_choice, :choices
           
        end
    end

    down do
        alter_table(:outcomes)do
            drop_foreign_key :id_career
            drop_foreign_key :id_choice
          
        end
    end
end