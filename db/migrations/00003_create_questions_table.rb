# frozen_string_literal: true

Sequel.migration do
  up do
    create_table(:questions) do
      primary_key   :name
      String        :description
      DateTime      :created_at,   default: Sequel::CURRENT_TIMESTAMP
      DateTime      :updated_at,   default: Sequel::CURRENT_TIMESTAMP
    end
  end

  down do
    drop_table(:questions)
  end
end
