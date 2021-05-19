class Choice < Sequel::Model

	many_to_one :question
	one_to_many :response
	one_to_many :outcome
	
end