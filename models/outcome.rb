class Outcome < Sequel::Model
	many_to_one :career
	many_to_one :choice

	plugin :validation_helpers
	def validate
		super 	
			validates_presence [:career_id,:choice_id]
	end
end