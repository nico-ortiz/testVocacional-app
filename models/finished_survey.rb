# frozen_string_literal: true

class Finished_Survey < Sequel::Model # rubocop:todo Naming/ClassAndModuleCamelCase, Style/Documentation
  many_to_one :career

  plugin :validation_helpers
  def validate
    super
    validates_presence [:career_id]
  end
end
