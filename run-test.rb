#!/usr/bin/env ruby
require 'benchmark'
require 'net/http'

TEST_URI = URI('http://localhost:9999/test')

def run_requests(req_number)
	for i in 0..req_number
		Net::HTTP.get(TEST_URI)
	end
end

if ARGV.size != 1
	puts "Usage: ./run-test.rb request-number"
	exit
end

request_number = ARGV[0].to_i

time = Benchmark.realtime do
	run_requests(request_number)
end

puts
puts "Requests number:     #{request_number}"
puts "Time taken:          #{time} seconds"
puts "Request per second:  #{request_number/time}"
puts