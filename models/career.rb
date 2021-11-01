# frozen_string_literal: true

class Career < Sequel::Model # rubocop:todo Style/Documentation
  one_to_many :outcomes
  one_to_many :surveys
  one_to_many :finished_surveys

  plugin :validation_helpers
  def validate
      super # rubocop:todo Layout/IndentationWidth
          validates_presence [:name] # rubocop:todo Layout/IndentationConsistency
  end
end
