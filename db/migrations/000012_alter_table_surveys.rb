Sequel.migration do
    up do
        alter_table(:surveys) do
            add_foreign_key :id_career, :careers
        end
    end

    down do
        alter_table(:surveys)do
            drop_foreign_key :id_career
        end
    end
end