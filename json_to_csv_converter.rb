require 'csv'
require 'json'

  class Json_to_csv_converter
    
    #parse json and put data in ruby hash
    file = File.read("input_data.json")
    original_hash = JSON.parse(file)
    
    #array of_hashes w/ just data
    array_of_hashes = original_hash.values
    
    #saving keys/headers from first hash
    headers = array_of_hashes[0].keys
     
    #write to csv
    CSV.open("new_file.csv", "wb") do |csv|
      
              #first line is headers
              csv << headers
              
              #fetch values using header keys for all json 
              original_hash.each_value { |value|
                  csv << value.fetch_values(headers[0], headers[1], headers[2], headers[3])}
    end
  end