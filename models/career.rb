class Career < Sequel::Model
	one_to_many :outcome
	one_to_many :survey	
end