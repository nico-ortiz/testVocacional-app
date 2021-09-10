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
    @career = params[:career_name]
    erb :info_career_index 
  end


  get "/search-career" do
    @career = params[:career_name]
    erb :info_career_index
  end
  
  post "/posts" do
    request.body.rewind  # in case someone already read it
    data = JSON.parse request.body.read
    post = Post.new(description: data['desc'])
    if post.save
      [201, { 'Location' => "posts/#{post.id}" }, 'CREATED']
    else
      [500, {}, 'Internal Server Error']
    end
  end


  get '/posts' do
    p = Post.where(id: 1).last
    p.description
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
    @career = Career.find(id: career_id).name
    @pointsTotal = careerWithMaxPoints["points"]
        
    survey.update career_id: career_id
    erb :finish_template
  end

end


