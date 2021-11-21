# frozen_string_literal: true

Sequel.migration do
  up do
    create_table(:surveys) do
      primary_key   :id_survey
      String        :name
      DateTime      :created_at,   default: Sequel::CURRENT_TIMESTAMP
      DateTime      :updated_at,   default: Sequel::CURRENT_TIMESTAMP
    end
  end

  down do
    drop_table(:surveys)
  end
end
