require './models/init.rb'
require './controllers/CareerController'
require './controllers/SurveyController'

class App < Sinatra::Base
  use CareerController
  use SurveyController

  get '/' do
    redirect :Main
  end
  
  
  get '/Main' do
    erb :landing
  end
  

  get '/vocational_test' do
    erb :user_load
  end


  #post '/surveys' do    
  #  @survey = Survey.new(username: params[:name])
  #  if @survey.save
  #    [201, { 'Location' => 'surveys/#{@survey.id}' }, 'User created sucesfully'] 
  #    @questions = Question.all
  #    erb :questions_index
  #  else
  #    [504, {}, 'Internal server error']
  #  end
  #end


  get "/surveys" do
    @surveys = Survey.all
    erb :info_survey_index 
  end

  post "/responses" do
    survey = Survey.find(id: params[:survey_id])
    
    params[:question_id].each do |question|
      response = Response.new(question_id: question, survey_id: survey.id, choice_id: params[:"#{question}"])
      response.save
    end
 
    careerWithMaxPoints = survey.career_obtained(survey)

    career_id = careerWithMaxPoints["career"]
    Finished_Survey.create(career_id: career_id)
    @career = Career.find(id: career_id).name
    @pointsTotal = careerWithMaxPoints["points"]
        
    survey.update career_id: career_id
    erb :finish_template
  end


end

