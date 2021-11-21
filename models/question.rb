# frozen_string_literal: true

class Question < Sequel::Model # rubocop:todo Style/Documentation
  one_to_many :responses
  one_to_many :choices

  plugin :validation_helpers
  def validate
    super
    validates_presence %i[name description number type]
  end
end
