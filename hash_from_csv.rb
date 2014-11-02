#!/usr/bin/env ruby
require 'csv'

class HashFromCSV
  attr_reader :output
  def initialize(csv)
    @csv = csv
    @output = []
    parse(csv)
  end

  def parse(csv)
    CSV.foreach(csv, headers: true, header_converters: :symbol, col_sep: ',') do |row|
      output << make_hash(row, row.headers)
    end
  end

  def make_hash(row, headers)
    headers.each_with_object({}) do |header, hash|
      hash[header] = row[header]
    end
  end

  def pbcopy
    str = output.inspect
    IO.popen('pbcopy', 'w') { |f| f << str }
    str
  end

end

parsed_csv = HashFromCSV.new(ARGV.first)
parsed_csv.pbcopy
