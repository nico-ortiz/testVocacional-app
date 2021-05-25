   require './models/init.rb'

class App < Sinatra::Base
  get '/' do
    erb :hello_template
  end



  post "/careers" do
    career = Career.new(name: params[:name])

    if career.save
      [201, { 'Location' => "careers/#{career.id}" }, 'CREATED']
      #redirect_to "http://localhost:9292/careers"
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

  get '/vocational-test' do
    "Hello World"
  end

  post '/surveys' do
    survey = Survey.new(username: params[:username], career_id: 1)
    if survey.save
      [201, { 'Location' => "surveys/#{survey.username}" }, 'User created sucesfully']
    else
      [500, {}, 'Internal Server Error']
    end
  end

  get "/surveys" do
    form = "<form action = '/surveys' method = 'POST'>" 
    form += "<label for= 'nombre carrera'>Enter career</label>" 
    form += "<br/>" 
    form += "<input type = 'text' name = 'name' placeholder = 'Escribe carrera'>"
    form += "<input type = 'submit' value = 'Enviar'>" 
    form += "</form>"
  end
  
end

