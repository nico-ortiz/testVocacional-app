require File.expand_path '../../test_helper.rb', __FILE__

class ChoiceTest < MiniTest::Unit::TestCase
  MiniTest::Unit::TestCase

  def test_choice_must_has_text
  	#Arrenge
  	choice = Choice.new

  	#Act
  	choice.text = nil

  	#Assert
  	assert_equal(choice.valid?,false)
  end

   def test_choice_must_has_question_id
  	#Arrenge
  	choice = Choice.new

  	#Act
  	choice.question_id = ''

  	#Assert
  	assert_equal(choice.valid?,false)
  end

  def test_choice_must_has_same_question_id
  	#Arrange
  	question = Question.create(description: '¿Te hace daño la pantalla de la pc?', type: 'MC', number: 2, name: 'Salud')
  	choice1 = Choice.create(text: 'Si', question_id: question.id)
  	choice2 = Choice.create(text: 'De vez en cuando', question_id: question.id)
  	choice3 = Choice.create(text: 'No', question_id: question.id)

  	#Assert
  	assert_equal(choice1.question.id == choice2.question.id, choice2.question.id == choice3.question.id)
  end

  def test_choice_has_many_response
  	#Arrange
  	survey = Survey.create(username: 'Federico')

  	question = Question.create(description: '¿Arrancaste alguna carrera y dejaste?', type: 'MC', number: 7, name: 'General')

  	choice = Choice.create(text: 'Nunca', question_id: question.id)

  	resp1 = Response.create(choice_id: choice.id, question_id: question.id, survey_id: survey.id)
  	resp2 = Response.create(choice_id: choice.id, question_id: question.id, survey_id: survey.id)
  	resp3 = Response.create(choice_id: choice.id, question_id: question.id, survey_id: survey.id)

  	#Assert
  	assert_equal(choice.responses.count,3)
  end






end
