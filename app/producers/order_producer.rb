class OrderProducer
  TOPICS = {
    create: 'EC_NEW_ORDER'
  }

  def initialize(order, action:)
    @order = order
    @topic = TOPICS[action]
  end

  def run
    producer.produce(order.to_json, topic: topic, key: "order_#{order.id}", partition_key: "order_#{order.id}")
    producer.deliver_messages
  end

  private

  attr_accessor :order, :topic

  def producer
    @producer ||= Example.kafka.producer
  end
end