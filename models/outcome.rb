class Outcome < Sequel::Model
	many_to_one :career
	many_to_one :choice
end