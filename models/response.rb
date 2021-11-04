# frozen_string_literal: true

class Response < Sequel::Model # rubocop:todo Style/Documentation
  many_to_one :question
  many_to_one :survey
  many_to_one :choice

  plugin :validation_helpers
  def validate
      super # rubocop:todo Layout/IndentationWidth
      validates_presence %i[question_id survey_id choice_id]
  end
end
