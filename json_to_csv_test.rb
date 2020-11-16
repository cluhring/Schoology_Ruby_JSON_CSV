require 'json'
require 'minitest'
require 'minitest/autorun'
require './Json_to_csv'

class Json_to_csv_test < MiniTest::Test
  def test_hash_of_hashes_to_csv
    test_json = JSON.parse('{"hash1":{"key1":"value1","key2":"value2","key3":"value3","key4":"value4"}}')
    expected_result = "key1,key2,key3,key4\nvalue1,value2,value3,value4\n"
    assert_equal(expected_result, Json_to_csv.json_hash_to_csv(test_json), "FAIL: Json object to csv failed")
  end
end
