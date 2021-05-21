class Survey < Sequel::Model
    many_to_one :career
    one_to_many :responses
end