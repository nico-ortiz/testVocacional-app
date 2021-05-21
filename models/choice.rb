class Choice < Sequel::Model
	many_to_one :question
	one_to_many :responses
	one_to_many :outcomes	
end