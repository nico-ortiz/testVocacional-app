# frozen_string_literal: true

class Outcome < Sequel::Model # rubocop:todo Style/Documentation
  many_to_one :career
  many_to_one :choice

  plugin :validation_helpers
  def validate
    super
    validates_presence %i[career_id choice_id]
  end
end
