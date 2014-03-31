# Ruby Client for ZooKeeper <--> WebSocket bridge

Used for fast failover and dynamic configuration.

Point the UpdateClient instance at your WebSocket server
instance.

Clients will receive data values upon connecting,
as well as after any disconnect/reconnect operations.

# Usage

    require 'zkws-client'

    handler = lambda {|data| puts data.inspect}

    client = ZkWs::Client.new('http://localhost:8080/', handler)
    client.watch '/foo'
    client.watch '/bar'

    loop do
      # keep spinning...
      sleep 5
    end

* The handler receives all 'update' callbacks
* The path is stored under the 'path' attribute of the callback data

