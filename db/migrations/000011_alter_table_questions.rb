Sequel.migration do
    up do
        alter_table(:questions) do
            rename_column :name, :id_question
        end
    end
end
