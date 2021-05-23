require File.expand_path '../../test_helper.rb', __FILE__

class SurveyTest < MiniTest::Unit::TestCase
  MiniTest::Unit::TestCase

  def test_survey_must_has_username
    # Arrange
    survey = Survey.new
    # Act
    survey.username = ''
    # Assert
    assert_equal survey.valid?, false 
  end

  def test_survey_has_a_career
    # Arrange
    career = Career.create(name:'Agrimensor')
    survey1 = Survey.create(username:'Nico Ortiz', career_id: career.id)
    survey2 = Survey.create(username:'Joaco Moran', career_id: career.id)
    # Act
    
    # Assert
    assert_equal(survey1.career.id,survey2.career.id)
  end

  def test_survey_has_diff_career
    # Arrange
    career1 = Career.create(name:'Agrimensor')
    career2 = Career.create(name:'Peon de estancia')
    survey1 = Survey.create(username:'Nico Ortiz', career_id: career1.id)
    survey2 = Survey.create(username:'Joaco Moran', career_id: career2.id)
    # Act
    
    # Assert
    assert_equal(false,survey1.career.id==survey2.career.id)
  end
end