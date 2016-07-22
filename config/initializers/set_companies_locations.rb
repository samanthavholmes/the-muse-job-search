require 'open-uri'

def get_companies_from_api
  results = JSON.parse(open("https://api-v2.themuse.com/companies?page=0").read)["results"]
  i = 1
  companies = []
  locations = []
  until results.empty?
    results.each do |company|
      companies << company["name"]
      location_results = get_locations_from_api(results)
      location_results.each do |location|
        locations << location unless locations.include?(location)
      end
    end
    results = JSON.parse(open("https://api-v2.themuse.com/companies?page=#{i}").read)["results"]
    i += 1
  end
  return [companies, locations]
end

def get_locations_from_api(results)
  locations = []
  results.each do |result|
    result["locations"].each do |location|
      locations << location["name"] unless locations.include?(location["name"])
    end
  end
  return locations
end


companies_and_locations = get_companies_from_api
$companies = companies_and_locations[0].sort
$locations = companies_and_locations[1].sort

