require 'sneakers'

module Mdi
  module BagValidator
    class Base
      include Sneakers::Worker
      from_queue 'bag_validation'

      def work(msg)
        worker_trace "received #{msg}"
        ack!
      end
    end
  end
end
