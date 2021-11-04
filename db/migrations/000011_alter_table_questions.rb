# frozen_string_literal: true

Sequel.migration do
  up do
      alter_table(:questions) do # rubocop:todo Layout/IndentationWidth
          rename_column :name, :id_question # rubocop:todo Layout/IndentationWidth
      end
  end
end
