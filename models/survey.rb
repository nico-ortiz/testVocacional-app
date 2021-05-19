class Survey < Sequel::Model
    many_to_one :career
end