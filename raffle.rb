#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)
unless File.exist?('./config.rb')
  puts "Raffler not configured - check the readme to see how to configure it."
  exit
end
require './config.rb'

def print_tweet(tweet)
  puts "\t@#{tweet.user.screen_name} (#{tweet.user.name}) - #{tweet.text}"
end

puts "Searching for entries for the query - '#{QUERY}'"
tweets = $twitter_client.search(QUERY, result_type: 'recent').take(1000).to_a

print "Found #{tweets.count} tweets..."
people = tweets.uniq { |tweet| tweet.user }
puts "from #{people.count} different people"

if people.empty?
  puts "No entries yet... goodbye"
  exit
end

puts "Choosing #{AMOUNT} winners..."
shortlist = people.sample(AMOUNT * 2)
winners = shortlist.slice(0...AMOUNT)
runner_ups = shortlist - winners

puts "\n♫♫♫♫ drumroll ♫♫♫♫\n\n"

puts "The #{AMOUNT} winners are - "
winners.each { |t| print_tweet(t) }

puts "\n\n Runner ups - "
runner_ups.each { |t| print_tweet(t) }