# frozen_string_literal: true

Sequel.migration do
  up do
      alter_table(:responses) do # rubocop:todo Layout/IndentationWidth
          add_foreign_key :id_question, :questions # rubocop:todo Layout/IndentationWidth
          add_foreign_key :id_survey, :surveys
          add_foreign_key :id_choice, :choices
      end
  end

  down do
    alter_table(:responses) do
        drop_foreign_key :id_question # rubocop:todo Layout/IndentationWidth
        drop_foreign_key :id_survey
        drop_foreign_key :id_choice
    end
  end
end
