# frozen_string_literal: true

Sequel.migration do # rubocop:todo Metrics/BlockLength
  up do
      alter_table(:careers) do # rubocop:todo Layout/IndentationWidth
          rename_column :career_id, :id # rubocop:todo Layout/IndentationWidth
      end
      alter_table(:choices) do
          rename_column :id_choice,   :id # rubocop:todo Layout/IndentationWidth
          rename_column :id_question, :question_id
      end
      alter_table(:outcomes) do
          rename_column :id_outcome, :id # rubocop:todo Layout/IndentationWidth
          rename_column :id_choice,  :choice_id
      end
      alter_table(:questions) do
          rename_column :id_question, :id # rubocop:todo Layout/IndentationWidth
      end
      alter_table(:responses) do
          rename_column :id_response, :id # rubocop:todo Layout/IndentationWidth
          rename_column :id_question, :question_id
          rename_column :id_survey,   :survey_id
          rename_column :id_choice,   :choice_id
      end
      alter_table(:surveys) do
          rename_column :id_survey, :id # rubocop:todo Layout/IndentationWidth
          rename_column :name, :username
      end
  end
end
