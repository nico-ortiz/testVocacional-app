require './models/init.rb'

class App < Sinatra::Base
  get '/' do
    redirect :Main
  end
  
  
  get '/Main' do
    erb :landing
  end


  post "/careers" do
    career = Career.new(name: params[:name])

    if career.save
      [201, { 'Location' => "careers/#{career.id}" }, 'CREATED']
      redirect :careers
    else
      [500, {}, 'Internal Server Error']
    end
  end


  get "/careers" do
    @careers = Career.all
    erb :careers_index
  end


  get "/careers/:id" do
    @career = Career.find(id: params[:id])
    @careerid = @career.id
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
    erb :test_index
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
  
    careersPoints = []
    for career in Career.all 
      careersPoints.push({"career" => career.id, "points" => 0})
    end
    
    choicesUser = survey.responses.map{ |elem| elem.choice_id }

    #Filtra las choices de Outcome, tal que estas choices son de las responses del user
    choices = Outcome.all.filter{ |elem| choicesUser.include? elem.choice_id}

    for c in choices
      idx = careersPoints.index{ |elem| elem["career"] == c.career_id}
      if(idx)
        careersPoints[idx]["points"] += 1
      end
    end

    careerWithMaxPoints = careersPoints.max_by{ |elem| elem["points"]}
    career_id = careerWithMaxPoints["career"]
    points = careerWithMaxPoints["points"]

    @career = Career.find(id: career_id).name
    @pointsTotal = points
    @careerid = career_id
    
    survey.update career_id: career_id
    erb :finish_template
  end

end


