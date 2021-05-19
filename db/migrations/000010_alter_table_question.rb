Sequel.migration do
    up do
        alter_table(:questions)do
            add_column :number, Integer
        end
    end

    down do
        alter_table(:questions)do
            drop_column :number
        end
    end
end
