require "./models/init.rb"
class CareerServices

    def self.get_all_careers()
        Career.all
    end

    def self.query_career_date(start_date, finish_date, carrera)
        career = Career.find(name: carrera).id
        return Finished_Survey.all.filter{|x| x.career_id == career && x.created_at.strftime("%Y-%m-%d") >= start_date && x.created_at.strftime("%Y-%m-%d") <= finish_date}.count
    end
end