# frozen_string_literal: true

require File.expand_path '../test_helper.rb', __dir__

class QuestionTest < MiniTest::Unit::TestCase # rubocop:todo Style/Documentation
  MiniTest::Unit::TestCase # rubocop:todo Lint/Void

  def test_question_must_has_name
      # Arrange
      question = Question.new # rubocop:todo Layout/IndentationWidth

      # Act
      question.name = nil

      # Assert
      assert_equal(question.valid?, false)
  end

  def test_question_must_has_number
      # Arrange
      question = Question.new(name: 'Aptitudes', number: nil) # rubocop:todo Layout/IndentationWidth

      # Act

      # Assert
      assert_equal(question.valid?, false)
  end

  def test_question_must_has_description
      # Arrange
      question = Question.new(name: 'Matematicas', number: 10, description: nil) # rubocop:todo Layout/IndentationWidth

      # Act

      # Assert
      assert_equal(question.valid?, false)
  end

  def test_question_must_has_type
      # Arrange
      question = Question.new(name: 'Gustos', number: 6, description: '¿Te gusta el helado?', type: nil) # rubocop:todo Layout/IndentationWidth

      # Act

      # Assert
      assert_equal(question.valid?, false)
  end

  def test_question_must_has_atributes_valid
      # Arrange
      question = Question.new(name: 'Deportes', number: 1, description: '¿Realiza deportes?', type: 'Multiple opcion') # rubocop:todo Layout/IndentationWidth

      # Act

      # Assert
      assert_equal(question.valid?, true)
  end

  def test_has_many_responses # rubocop:todo Metrics/AbcSize
      # Arrange
      question = Question.create(name: 'Series', number: 34, description: 'The Office o Friends', type: 'Una opcion') # rubocop:todo Layout/IndentationWidth

      # Act
      choice1 = Choice.create(text: 'The Office', question_id: question.id)
      choice2 = Choice.create(text: 'Friends', question_id: question.id) # rubocop:todo Lint/UselessAssignment
      survey1 = Survey.create(username: 'Carlitos Tevez')
      survey2 = Survey.create(username: 'Ronaldo Nazario')
      Response.create(question_id: question.id, choice_id: choice1.id, survey_id: survey1.id)
      Response.create(question_id: question.id, choice_id: choice1.id, survey_id: survey2.id)
      choice = Choice.find(text: 'The Office')

      # Assert
      assert_equal(choice.responses.count, 2)
  end

  def test_has_many_choices
      # Arrange
      question = Question.create(name: 'Maths', number: 123, description: '2+2?', type: 'Multiple choice') # rubocop:todo Layout/IndentationWidth

      # Act
      Choice.create(text: '2', question_id: question.id)
      Choice.create(text: '4', question_id: question.id)
      Choice.create(text: '6', question_id: question.id)
      Choice.create(text: '10', question_id: question.id)

      # Assert
      assert_equal(question.choices.count, 4)
  end
end
