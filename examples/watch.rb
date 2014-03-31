require 'rubygems'
require 'zkws-client'

handler = lambda {|data| puts data.inspect}

client = ZkWs::Client.new('http://localhost:8080/', handler)
client.watch '/foo'
client.watch '/bar'

loop do
  sleep 5
end


