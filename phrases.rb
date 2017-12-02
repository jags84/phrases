#!/usr/bin/env ruby
# encoding: utf-8
# Using ruby 2.4.2

# Class
class Phrases
  attr_reader :phrases, :words

  def initialize (phrases = [],words = [])
    @phrases = phrases.map(&:downcase)
    @words = words.map(&:downcase)
  end

  # Find the longest phrase
  def find_longest_phrase
    phrases.sort_by(&:length).reverse.each do |phrase|
      if check_phrase(phrase)
        puts "The answer would be: #{phrase}"
        return
      end
    end
    puts "The answer would be blank"
  end

  # Check if phrase contains the words
  def check_phrase(phrase)
    return clean_phrase(phrase).split(' ').map{|p_word| words.include?(p_word)}.all?
  end

  # Add space to specials characters
  def clean_phrase(phrase)
    return phrase.gsub(/,|;|\./, ',' =>' , ', ';' => ' ; ', '.' => ' . ')
  end
end

# Run
result = Phrases.new(['kiss me, elbow','why, did you kiss me',';hello world, how are you today.'],['kiss', 'why', 'me', 'did', 'you', 'elbow', ',' ,'Hello','world','how','are','you','today','.',';'])
result.find_longest_phrase
