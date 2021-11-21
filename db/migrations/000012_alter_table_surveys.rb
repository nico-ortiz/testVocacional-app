# frozen_string_literal: true

Sequel.migration do
  up do
      alter_table(:surveys) do # rubocop:todo Layout/IndentationWidth
          add_foreign_key :id_career, :careers # rubocop:todo Layout/IndentationWidth
      end
  end

  down do
    alter_table(:surveys) do
        drop_foreign_key :id_career # rubocop:todo Layout/IndentationWidth
    end
  end
end
