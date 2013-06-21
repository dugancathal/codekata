#!/usr/bin/env ruby

require 'nokogiri'

class WeatherHandler
  def initialize(filename)
    @filename = filename
  end

  def day_with_smallest_spread
    calculate_spread_for_rows(tableize(text)).min_by {|row| row.last }.first
  end

  private

  def text
    doc = Nokogiri::HTML(File.read(@filename))
    doc.css('pre').text
  end

  def tableize(text)
    text.split("\n")
      .map {|line| line.split(/\s+/)[1..-1] }
      .select {|fields| fields && fields.first =~ /^\d+/ }
  end

  def calculate_spread_for_rows(rows)
    rows.map {|row| [row.first.to_i, row[1].to_i - row[2].to_i] }
  end
end

puts WeatherHandler.new(ARGV[0]).day_with_smallest_spread
