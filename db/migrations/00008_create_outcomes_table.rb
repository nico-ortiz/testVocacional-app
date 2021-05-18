Sequel.migration do
    up do
      create_table(:outcomes) do
        primary_key   	:id_outcome
        DateTime      	:created_at,   default: Sequel::CURRENT_TIMESTAMP
        DateTime      	:updated_at,   default: Sequel::CURRENT_TIMESTAMP
      end
    end
  
    down do
      drop_table(:outcomes)
    end
  end