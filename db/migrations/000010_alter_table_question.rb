# frozen_string_literal: true

Sequel.migration do
  up do
      alter_table(:questions) do # rubocop:todo Layout/IndentationWidth
          add_column :number, Integer # rubocop:todo Layout/IndentationWidth
      end
  end

  down do
    alter_table(:questions) do
        drop_column :number # rubocop:todo Layout/IndentationWidth
    end
  end
end
