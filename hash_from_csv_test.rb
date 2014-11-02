require 'minitest/autorun'
require_relative 'hash_from_csv'

class HashFromCSVTest < MiniTest::Test
  def test_ouput_hash_matching_headers
    output = [
      {header_1: 'row 1 header 1', header_2: 'row 1 header 2', header_3: 'row 1 header 3'},
      {header_1: 'row 2 header 1', header_2: 'row 2 header 2', header_3: 'row 2 header 3'}
    ]
    parsed_csv = HashFromCSV.new('test.csv')
    assert_equal output, parsed_csv.output
  end

end
