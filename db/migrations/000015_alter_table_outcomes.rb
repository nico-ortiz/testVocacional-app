# frozen_string_literal: true

Sequel.migration do
  up do
      alter_table(:outcomes) do # rubocop:todo Layout/IndentationWidth
          add_foreign_key :id_career, :careers # rubocop:todo Layout/IndentationWidth
          add_foreign_key :id_choice, :choices
      end
  end

  down do
    alter_table(:outcomes) do
        drop_foreign_key :id_career # rubocop:todo Layout/IndentationWidth
        drop_foreign_key :id_choice
    end
  end
end
