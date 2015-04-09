require 'sneakers'
require 'open3'
require 'socket'

module Mdi
  module BagValidator
    class Base
      include Sneakers::Worker
      from_queue 'bag_validation'
      opts = {   :env => 'test',
                 :amqp => ENV['AMQP_URL'] || 'amqp:://localhost',
                 :durable => true,
                 :ack => true,
                 :threads => 1,
                 :prefetch => 1,
                 :timeout_job_after => 100000000,
                 :exchange => 'rstar_direct',
                 :exchange_type => :direct,
                 :heartbeat_interval => 5
             }
      Sneakers.configure(opts)

      def work(msg)
        cmd      = ENV['MDI_EXECUTABLE'] || '/usr/local/bin/bag verifyvalid'
        hostname = ENV['HOSTNAME']
        service_name = ENV['MDI_SERVICE_NAME'] || File.basename(cmd)
        puts "============================================================="
        puts "received #{msg}"
        o,e,s = Open3.capture3("#{cmd} #{msg}")
        puts "STDOUT:"
        puts "#{o}"
        puts "-------------------------------------------------------------"
        puts "STDERR:"
        puts "#{e}"
        puts "-------------------------------------------------------------"
        puts "STATUS:"
        puts "#{s}"
        puts "============================================================="
        result_msg = "#{service_name}:#{hostname}:#{msg}:" + (s == 0 ? 'passed' : 'FAILED')
        publisher.publish(result_msg, routing_key: 'rstar.bag_validator.result')
        ack!
      end
      def publisher
        @publisher ||= Sneakers::Publisher.new(publisher_opts)
      end
      def publisher_opts
        { exchange:      'rstar_topic',
          exchange_type: :topic,
          routing_key:   'rstar.bag_validator.result',
          durable:       true,
          ack:           true
        }
      end
    end
  end
end
