#!/usr/bin/env ruby

class FootballScorer
  def initialize(filename)
    @filename = filename
  end

  def team_with_smallest_spread
    spreads.min_by {|row| row.last }.first
  end

  def spreads
    rows.map {|row| spread_for(row) }
  end

  private 

  def rows
    File.read(@filename).split("\n")
      .map do |row|
        row.match /\s+\d+\.\s+(\w+).*?(\d+\s+\-\s+\d+)/ do |match|
          match[1..2]
        end
      end.select {|row| !row.nil? }
  end

  def spread_for(row)
    scored, _, lost = row.last.split(/\s+/)
    [row.first, (scored.to_i - lost.to_i).abs]
  end
end

puts FootballScorer.new(ARGV[0]).team_with_smallest_spread
