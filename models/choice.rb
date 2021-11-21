# frozen_string_literal: true

class Choice < Sequel::Model # rubocop:todo Style/Documentation
  many_to_one :question
  one_to_many :responses
  one_to_many :outcomes

  plugin :validation_helpers
  def validate
    super
    validates_presence %i[text question_id]
  end
end
