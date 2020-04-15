class OrderConsumer
  TOPICS = {
    create: 'EC_NEW_ORDER'
  }

  def initialize(*actions)
    @topics = actions.map { |action| TOPICS[action] }
  end

  def run
    topics.each { |topic| consumer.subscribe(topic) }
    consumer.each_message(automatically_mark_as_processed: false) do |message|
      puts "Topic -> #{message.topic} :: Partition -> #{message.partition} :: " \
           "Offset -> #{message.offset} :: Message Key -> #{message.key}"
      puts message.value, ''
    end
  end

  def stop
    trap("TERM") { consumer.stop }
  end

  private

  attr_accessor :topics

  def consumer
    @consumer ||= Example.kafka.consumer(group_id: 'order-consumer')
  end
end