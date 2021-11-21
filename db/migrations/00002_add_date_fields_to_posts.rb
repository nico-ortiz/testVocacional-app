# frozen_string_literal: true

Sequel.migration do
  up do
    add_column :posts, :created_at, DateTime, default: Sequel::CURRENT_TIMESTAMP
    add_column :posts, :updated_at, DateTime, default: Sequel::CURRENT_TIMESTAMP
  end

  down do
    drop_column :posts, :created_at
    drop_column :posts, :updated_at
  end
end
