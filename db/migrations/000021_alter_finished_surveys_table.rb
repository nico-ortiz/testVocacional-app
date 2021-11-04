# frozen_string_literal: true

Sequel.migration do
  up do
      alter_table(:finished_surveys) do # rubocop:todo Layout/IndentationWidth
          rename_column :id_finished_survey, :id # rubocop:todo Layout/IndentationWidth
      end
  end
end
