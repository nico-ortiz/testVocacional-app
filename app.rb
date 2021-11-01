require './models/init.rb'

class App < Sinatra::Base
  get '/' do
    redirect :Main
  end
  
  
  get '/Main' do
    erb :landing
  end
  

  get "/careers" do
    @careers = Career.all
    erb :careers_index
  end


  get "/career" do
    get_career_by_name()
  end


  get "/search-career" do
    get_career_by_name()
  end

  get "/career-query" do
    @careers = Career.all
    erb :career_query
  end

  get '/vocational_test' do
    erb :user_load
  end


  post '/surveys' do    
    @survey = Survey.new(username: params[:name])
    if @survey.save
      [201, { 'Location' => "surveys/#{@survey.id}" }, 'User created sucesfully'] 
      @questions = Question.all
      erb :questions_index
    else
      [504, {}, 'Internal server error']
    end
  end


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
  
  get "/finished_survey" do

    @carrera = params[:carrera]
    @start_date = params[:start_date]
    @finish_date = params[:finish_date]

    career = Career.find(name: @carrera).id
    @count = Finished_Survey.all.filter{|x| x.career_id == career && x.created_at.strftime("%Y-%m-%d") >= @start_date && x.created_at.strftime("%Y-%m-%d") <= @finish_date}.count
    erb :result_career_query
  end


  def get_career_by_name
    @career = params[:career_name]
    erb :info_career_index  
  end

end

