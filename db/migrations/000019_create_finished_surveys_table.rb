# frozen_string_literal: true

Sequel.migration do
  up do
      create_table(:finished_surveys) do # rubocop:todo Layout/IndentationWidth
          primary_key :id_finished_survey # rubocop:todo Layout/IndentationWidth
          DateTime    :created_at, default: Sequel::CURRENT_TIMESTAMP
          DateTime    :updated_at, default: Sequel::CURRENT_TIMESTAMP
      end
  end

  down do
    drop_table(:finished_surveys)
  end
end
