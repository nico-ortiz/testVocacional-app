Sequel.migration do
	up do
		create_table(:cuestions) do
			primary_key :nombre
			String :descripcion
		    DateTime      :created_at,   default: Sequel::CURRENT_TIMESTAMP
  		    DateTime      :updated_at,   default: Sequel::CURRENT_TIMESTAMP
		end
	end

	down do
    drop_table(:cuestions)
  end
end

