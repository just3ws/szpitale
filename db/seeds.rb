# frozen_string_literal: true

HOSPITALS_JSON = 'https://raw.githubusercontent.com/incompass/coding-challenge-assets/master/hospitals.json'

require 'net/http'

response = Net::HTTP.get_response(URI(HOSPITALS_JSON))
hospitals_json = JSON.parse(response.body, symbolize_names: true)

hospitals_json.each do |hospital_json|
  hospital_id = hospital_json.slice(:id)
  hospital_attributes = hospital_json.except(:id)

  Hospital
    .create_with(hospital_attributes)
    .find_or_create_by(hospital_id)
end
