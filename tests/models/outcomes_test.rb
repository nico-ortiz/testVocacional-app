require File.expand_path '../../test_helper.rb', __FILE__

class OutcomeTest < MiniTest::Unit::TestCase
  MiniTest::Unit::TestCase

  def test_outcome_has_a_career_id
  	#Arrange
  	outcome = Outcome.new

  	#Act
  	outcome.career_id = nil

  	#Assert
  	assert_equal(outcome.valid?,false)	
  end

  def test_outcome_has_a_choice_id
    #Arrange
    outcome = Outcome.new

    #Act
    outcome.choice_id = nil

    #Assert
    assert_equal(outcome.valid?,false)  
  end

  def test_outcome_must_has_same_choice_id
    #Arrange
    choice = Choice.create(text: 'Hola que tal')
    career = Career.create(name: 'Agronomia')
    out1 = Outcome.create(choice_id: choice.id, career_id: career.id)
    out2 = Outcome.create(choice_id: choice.id, career_id: career.id)
    
    #Assert
    assert_equal(out2.choice.id == out1.choice.id, true)
  end


end
