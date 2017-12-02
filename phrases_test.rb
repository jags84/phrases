#!/usr/bin/env ruby
# encoding: utf-8
# Using ruby 2.4.2
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'phrases'

class PhrasesTest < Minitest::Test
  def setup
    @phrases = Phrases.new(['kiss me, elbow','why did you kiss me'],['kiss', 'why', 'me', 'did', 'you', 'elbow', ','])
  end

  def test_after_initilized_phrase_must_have_phrase_array
    assert_equal('Array', @phrases.phrases.class.to_s)
  end

  def test_after_initilized_phrase_must_have_words_array
    assert_equal('Array', @phrases.words.class.to_s)
  end

  def test_check_phrase_method_must_return_bool
    phrase = 'why did you kiss me'
    assert_equal(true, @phrases.check_phrase(phrase))
  end

  def test_clean_phrase_must_separate_specials_chars
    phrase = 'kiss me, elbow'
    assert_equal(@phrases.clean_phrase(phrase), 'kiss me ,  elbow')
  end

  def test_find_longest_phrase_method_must_print_longest_phrase_if_exist
    assert_output(@phrases.find_longest_phrase){ puts "The answer would be: why, did you kiss me" }
  end

  def test_find_longest_phrase_method_must_print_blank_if_doesnt_find_words
    new_phrases = Phrases.new(['kiss me, elbow','why did you kiss me'],['did', 'you', 'elbow', ','])
    assert_output(new_phrases.find_longest_phrase){ puts "The answer would be blank" }
  end
end
