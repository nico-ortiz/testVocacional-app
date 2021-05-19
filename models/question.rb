class Question < Sequel::Model
	one_to_many :response
	one_to_many :choice
	
end