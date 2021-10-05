Sequel.migration do
    up do
        alter_table(:finished_surveys) do
            rename_column :id_finished_survey, :id
        end
    end
end