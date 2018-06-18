# Use Pry everywhere
unless ENV['NOPRY']
  require "rubygems"
  require 'pry'
  Pry.start
  exit
end
