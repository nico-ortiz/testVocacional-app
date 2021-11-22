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

  not_found do 
    status 404
    erb :error_view404
  end

end

