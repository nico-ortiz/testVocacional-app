require File.expand_path '../../test_helper.rb', __FILE__

class FinishedSurveyTest < MiniTest::Unit::TestCase
    MiniTest::Unit::TestCase

    def test_finished_survey_has_a_career
        #Arrange
        career = Career.create(name: 'Tester')
        #Act
        finished_survey = Finished_Survey.create(career_id: career.id)
        #Assert
        assert_equal(finished_survey.career_id, career.id)
    end

    def test_finished_survey_has_career
        #Arrange
        finished_survey = Finished_Survey.new
        #Act
        finished_survey.career_id = nil
        #Assert
        assert_equal(finished_survey.valid?, false)
    end
end