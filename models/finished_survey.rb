class Finished_Survey < Sequel::Model
	many_to_one :career
	
	plugin :validation_helpers
	def validate
		super 
			validates_presence [:career_id]
	end
end