class Career < Sequel::Model
	one_to_many :outcomes
	one_to_many :surveys
    one_to_many :finished_surveys

	plugin :validation_helpers
    def validate
        super
            validates_presence [:name]
    end
end