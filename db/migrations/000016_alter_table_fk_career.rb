# frozen_string_literal: true

Sequel.migration do
  up do
      alter_table(:careers) do # rubocop:todo Layout/IndentationWidth
          rename_column :id_career, :career_id # rubocop:todo Layout/IndentationWidth
      end
      alter_table(:outcomes) do
          rename_column :id_career, :career_id # rubocop:todo Layout/IndentationWidth
      end
      alter_table(:surveys) do
          rename_column :id_career, :career_id # rubocop:todo Layout/IndentationWidth
      end
  end
end
