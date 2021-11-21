# frozen_string_literal: true

class Survey < Sequel::Model # rubocop:todo Style/Documentation
  many_to_one :career
  one_to_many :responses

  plugin :validation_helpers
  def validate
      super # rubocop:todo Layout/IndentationWidth
      validates_presence [:username]
  end

end
