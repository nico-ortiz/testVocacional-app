# frozen_string_literal: true

require File.expand_path '../test_helper.rb', __dir__

class FinishedSurveyTest < MiniTest::Unit::TestCase # rubocop:todo Style/Documentation
  MiniTest::Unit::TestCase # rubocop:todo Lint/Void

  def test_finished_survey_has_a_career
      # Arrange
      career = Career.create(name: 'Tester') # rubocop:todo Layout/IndentationWidth
      # Act
      finished_survey = Finished_Survey.create(career_id: career.id)
      # Assert
      assert_equal(finished_survey.career_id, career.id)
  end

  def test_finished_survey_has_career
      # Arrange
      finished_survey = Finished_Survey.new # rubocop:todo Layout/IndentationWidth
      # Act
      finished_survey.career_id = nil
      # Assert
      assert_equal(finished_survey.valid?, false)
  end
end
