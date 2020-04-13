class OrderProducer
  TOPICS = {
    create: 'EC_NEW_ORDER'
  }

  def initialize(order, action:)
    @order = order
    @topic = TOPICS[action]
  end

  def run
    producer.produce(event_wrap, topic: topic)
    producer.deliver_messages
  end

  private

  attr_accessor :order, :topic

  def event_wrap
    {
      event_name: "#{order.class}: #{order.id}",
      payload: order.to_json
    }.to_json
  end

  def producer
    @producer ||= Example.kafka.producer
  end
end