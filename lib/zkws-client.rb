require 'rubygems'
require 'SocketIO'

module ZkWs
  class Client
    def initialize(serviceUrl, fn)
      @callbacks = {}
      @socket = SocketIO.connect(serviceUrl, :sync => true) do
        before_start do
          on_connect         {puts "connected"}
          on_event('update') {|data| fn.call data[0] }
        end
      end
    end

    def watch(path)
      @socket.emit 'watch', {:path => path}
    end
  end
end

