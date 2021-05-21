Sequel.migration do
    up do
        alter_table(:questions)do
            add_column :name, String
        end
    end

    down do
        alter_table(:questions)do
            drop_column :name
        end
    end
end
