class Choice < Sequel::Model
	many_to_one :question
	one_to_many :responses
	one_to_many :outcomes	

	plugin :validation_helpers 
	def validate
		super 
			validates_presence [:text, :question_id]
	end

end