require_relative '../lib/DataClass.rb'

['admin', 'games', 'game'].each do |directory|
    Dir[File.join(__dir__, '..', 'lib', 'models', directory, '*.rb')].each { |file| require_relative file }
end

require_relative '../lib/instances.rb'