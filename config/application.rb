require 'telegram/bot'
require 'dotenv/load'
require 'byebug'

Dir[File.join(__dir__, 'initializers', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, '..', 'app', 'models', '*.rb')].each { |file| require file }
Dir[File.join(__dir__, '..', 'app', 'services', '*.rb')].each { |file| require file }
