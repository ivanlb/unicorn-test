#!/usr/bin/env ruby

require 'rubygems'
require 'camping'

Camping.goes :Test

module Test::Controllers
	class Index
		def get
			"This is a test message"
		end
	end

	class Test
		def get
			process
		end
	end
end

def process
	t = Time.now
	n = "%10.20f" % t.to_f
	last_value_char = n[n.size-1..n.size]
	if last_value_char.to_i.even?
		body = "LEFT\n"
	else
		body = "RIGHT\n"
	end
	body
end
