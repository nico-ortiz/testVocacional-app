Sequel.migration do 
    up do
        alter_table(:finished_surveys) do
            add_foreign_key :career_id, :careers
        end
    end
        
    down do
        alter_table(:finished_surveys) do
            drop_foreign_key :career_id
        end
    end
end
