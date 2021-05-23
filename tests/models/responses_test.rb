require File.expand_path '../../test_helper.rb', __FILE__

class SurveyTest < MiniTest::Unit::TestCase
  MiniTest::Unit::TestCase

    def test_response_has_question
        #Arrange
        response = Response.new

        #Act
        response.question_id = nil

        #Assert
        assert_equal(response.valid?,false)
    end

    def test_response_has_survey
        #Arrange
        response = Response.new(question_id: 1)

        #Act
        response.survey_id = nil

        #Assert
        assert_equal(response.valid?, false)
    end

    def test_response_has_choice
        #Arrange
        response = Response.new(question_id: 1, survey_id: 1)

        #Act
        response.choice_id = ''

        #Assert
        assert_equal(response.valid?, false)
    end

    def test_response_has_choice_survey_and_question
        #Arrange
        question = Question.create(name: 'Maths', number: 1200, description: '2*4', type: 'One choice')

        #Act
        choice1 = Choice.create(text: '2', question_id: question.id)
        choice2 = Choice.create(text: '8', question_id: question.id)
        choice3 = Choice.create(text: '6', question_id: question.id)

        survey = Survey.create(username: 'Dwight Schrute')

        Response.create(question_id: question.id, choice_id: choice2.id, survey_id: survey.id)

        choice = Choice.find(text: '8')
        survey = Survey.find(username: 'Dwight Schrute')
        response = Response.find(survey_id: survey.id)
        
        #Assert
        assert_equal(choice.id == response.choice_id, true)
    end

end