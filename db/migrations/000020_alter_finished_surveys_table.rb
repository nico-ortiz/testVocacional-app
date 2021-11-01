# frozen_string_literal: true

Sequel.migration do
  up do
      alter_table(:finished_surveys) do # rubocop:todo Layout/IndentationWidth
          add_foreign_key :career_id, :careers # rubocop:todo Layout/IndentationWidth
      end
  end

  down do
    alter_table(:finished_surveys) do
        drop_foreign_key :career_id # rubocop:todo Layout/IndentationWidth
    end
  end
end
