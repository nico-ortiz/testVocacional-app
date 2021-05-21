Sequel.migration do 
    up do
        alter_table(:careers) do
            rename_column :id_career, :career_id
        end    
        alter_table(:outcomes) do
            rename_column :id_career, :career_id
        end
        alter_table(:surveys) do
            rename_column :id_career, :career_id
        end
    end
end


