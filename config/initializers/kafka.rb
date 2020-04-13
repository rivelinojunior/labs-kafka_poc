require 'kafka'

module Example
  KAFKA_HOST = "localhost:9092"
  KAFKA_CLIENT_ID = "rubykafka_example"

  class << self
    def kafka
      @kafka ||=  Kafka.new([KAFKA_HOST], client_id: KAFKA_CLIENT_ID)
    end
  end
end