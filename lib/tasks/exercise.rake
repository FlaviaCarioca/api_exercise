namespace :exercise do
  desc "Imports data and save to database"
  task import_data: :environment do

    source = "http://data.sfgov.org/resource/vw6y-z8j6.json"

    response = Net::HTTP.get_response(URI.parse(source))

    data = response.body
    result = JSON.parse(data)

    result.each do |r|
      if(!r["case_id"].to_s.empty?)        
        c = Case.find_or_initialize_by(id: r["case_id"])
        c.id = r["case_id"]
        c.opened = r["opened"]
        c.closed = r["closed"]
        c.updated = r["updated"]
        c.status = r["status"]
        c.responsible_agency = r["responsible_agency"]
        c.category = r["category"]
        c.request_type = r["request_type"]
        c.request_details = r["request_details"]
        c.address = r["address"]
        c.supervisor_district = r["supervisor_district"]
        c.neighborhood = r["neighborhood"]
        c.source = r["source"]
        if (!r["media_url"].to_s.empty?)
          c.media_url = r["media_url"]["url"]
        end
        if (!r["point"].to_s.empty?)
          c.longitude = (r["point"]["longitude"]).to_f
          c.latitude = (r["point"]["latitude"]).to_f
        end
        c.save!
      end
    end
  end
end
