require "./models/init.rb"
require "./services/SurveyServices.rb"

class SurveyController < Sinatra::Base
    post '/surveys' do    
      begin
        @name = params[:name]
        SurveyServices.newSurvey(@name)
      rescue ArgumentError => exception
        exception.message
        erb :error_view504
      else
        erb :questions_index
      end
    end
end