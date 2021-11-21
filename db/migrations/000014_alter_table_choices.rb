# frozen_string_literal: true

Sequel.migration do
  up do
      alter_table(:choices) do # rubocop:todo Layout/IndentationWidth
          add_foreign_key :id_question, :questions # rubocop:todo Layout/IndentationWidth
      end
  end

  down do
    alter_table(:choices) do
        drop_foreign_key :id_question # rubocop:todo Layout/IndentationWidth
    end
  end
end
