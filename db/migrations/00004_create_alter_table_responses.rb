Sequel.migration do
  up do
    alter_table(:composes) do
        add_foreign_key :user_id, :users, :null=>false
        add_foreign_key :choice_id, :choices, :null=>false
        add_foreign_key :cuestion_id, :cuestions, :null=>false
    end
  end
  down do
    drop_column :users, :user_id
    drop_column :choices, :choice_id
    drop_column :cuestions, :cuestion_id
  end
end
