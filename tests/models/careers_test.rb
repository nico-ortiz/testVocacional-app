 require File.expand_path '../../test_helper.rb', __FILE__

class CareerTest < MiniTest::Unit::TestCase
  MiniTest::Unit::TestCase

  def test_career_has_many_surveys

  	#Arrange
  	career = Career.create(name: 'Spaceman')
  	
    
    #Act
    Survey.create(username: 'Nico Ortiz', career_id: career.id)
    Survey.create(username: 'Joaco Moran', career_id: career.id)
    Survey.create(username: 'Agus Giungi', career_id: career.id)
    #Assert
    assert_equal(career.surveys.count,3)
  end

  def test_career_has_many_outcomes
    
    #Arrange
  	career = Career.create(name: 'Dentist')

    #Act
    Outcome.create(career_id: career.id);
    Outcome.create(career_id: career.id);

    #Assert
    assert_equal(career.outcomes.count, 2)
  end

    

    
end