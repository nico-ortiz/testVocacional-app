class Survey < Sequel::Model
    many_to_one :career
    one_to_many :responses

    plugin :validation_helpers
    def validate
    	super
         validates_presence [:username, :career_id]
  	end
end