require "./models/init.rb"
require "./services/SurveyServices.rb"

class SurveyController < Sinatra::Base
    post '/surveys' do    
      begin
        @name = params[:name]
        @survey, @questions =SurveyServices.newSurvey(@name)
      rescue ArgumentError => exception
        exception.message
        erb :error_view504
      else
        erb :questions_index
      end
    end
    
    get "/surveys" do
      SurveyServices.getAllSurveys()
      erb :info_survey_index 
    end

    post "/responses" do
      question_id=params[:question_id]
      survey_id=params[:survey_id]
      choice_id=[]
      question_id.each_with_index do |question, i|
        choice_id[i] = params[:"#{question}"]
        puts question
      end
      
      @career, @pointsTotal= SurveyServices.responses(survey_id,choice_id)
      
      erb :finish_template
    end

  end