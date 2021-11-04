# frozen_string_literal: true

Sequel.migration do
  up do
    create_table(:responses) do
      primary_key   :id_response
      DateTime      :created_at,   default: Sequel::CURRENT_TIMESTAMP
      DateTime      :updated_at,   default: Sequel::CURRENT_TIMESTAMP
    end
  end

  down do
    drop_table(:responses)
  end
end
