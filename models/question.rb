class Question < Sequel::Model
	one_to_many :responses
	one_to_many :choices

	plugin :validation_helpers
	def validate
		super	
		validates_presence [:name, :description, :number, :type]
	end
end