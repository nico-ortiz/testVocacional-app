# frozen_string_literal: true

require File.expand_path '../test_helper.rb', __dir__

class CareerTest < MiniTest::Unit::TestCase # rubocop:todo Style/Documentation
  MiniTest::Unit::TestCase # rubocop:todo Lint/Void

  def test_career_has_many_surveys
    # Arrange
    career = Career.create(name: 'Spaceman')

    # Act
    Survey.create(username: 'Nico Ortiz', career_id: career.id) # rubocop:todo Layout/IndentationConsistency
    Survey.create(username: 'Joaco Moran', career_id: career.id) # rubocop:todo Layout/IndentationConsistency
    Survey.create(username: 'Agus Giungi', career_id: career.id) # rubocop:todo Layout/IndentationConsistency
    # Assert
    assert_equal(career.surveys.count, 3) # rubocop:todo Layout/IndentationConsistency
  end

  def test_career_has_many_outcomes
    # Arrange
    career = Career.create(name: 'Dentist')

    # Act
    Outcome.create(career_id: career.id, choice_id: 1)
    Outcome.create(career_id: career.id, choice_id: 2) # rubocop:todo Layout/IndentationConsistency

    # Assert
    assert_equal(career.outcomes.count, 2)
  end
end
