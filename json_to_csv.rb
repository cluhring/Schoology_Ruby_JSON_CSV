require 'csv'
require 'json'

class Json_to_csv
  
  def self.json_hash_to_csv(json)
    #parse json and put data in ruby hash
    #file = File.read("input_data.json")
    #original_hash = JSON.parse(file)
    original_hash = json
    
    #array of_hashes w/ just data
    array_of_hashes = original_hash.values
    
    #saving keys/headers from first hash
    headers = array_of_hashes[0].keys
     
    #write to csv
    CSV.generate do |csv|
      
              #first line is headers
              csv << headers
              
              #fetch values using header keys for all json 
              original_hash.each_value { |value|
                  csv << value.fetch_values(headers[0], headers[1], headers[2], headers[3])}
    end
  end
  
end

test_json = JSON.parse('{"0" :{
"courseTitle" : "CT148892374412371000",
"courseCode"  : "courseCode148892374412371900",
"sectionTitle"  : "ST0148892374412372500",
"sectionCode" : "sectionCode0148892374412372900"
},"1" : {
"courseTitle" : "CT148892374412371001",
"courseCode"  : "courseCode148892374412371901",
"sectionTitle"  : "ST0148892374412372501",
"sectionCode" : "sectionCode0148892374412372901"
}}')
puts Json_to_csv.json_hash_to_csv(test_json)