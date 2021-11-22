require "./models/init.rb"
require "./services/CareerServices.rb"

class CareerController < Sinatra::Base

    get "/careers" do
        @careers = CareerServices.get_all_careers()
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
    
    get "/career-query" do
        @careers = CareerServices.get_all_careers()
        erb :career_query
    end 

    get "/finished_survey" do

        @carrera = params[:carrera]
        @start_date = params[:start_date]
        @finish_date = params[:finish_date]  

        @count = CareerServices.query_career_date(@start_date, @finish_date, @carrera)

        erb :result_career_query
      end

end