Sequel.migration do 
    up do
        create_table(:finished_surveys) do
            primary_key :id_finished_survey
            DateTime    :created_at, default: Sequel::CURRENT_TIMESTAMP
            DateTime    :updated_at, default: Sequel::CURRENT_TIMESTAMP
        end
    end

    down do
        drop_table(:finished_surveys)
    end
end