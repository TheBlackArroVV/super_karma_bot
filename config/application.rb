require 'telegram/bot'
require 'dotenv/load'
require 'byebug'

puts 1
Dir[File.join(__dir__, 'initializers', '*.rb')].each { |file| require file }
puts 2
Dir[File.join(__dir__, '..', 'app', 'models', '*.rb')].each { |file| require file }
puts 3
Dir[File.join(__dir__, '..', 'app', 'services', '*.rb')].each { |file| require file }
puts 3
