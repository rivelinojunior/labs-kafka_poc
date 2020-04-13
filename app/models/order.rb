class Order  < Dry::Struct
  attribute :id, Types::Integer.default { rand(1..1000) }
  attribute :product, Types::String
  attribute :amount, Types::Float
  attribute :seller, Types::String.default { 'Rivelino' }
  attribute :buyer, Types::String.default { 'Junior' }

  def create
    OrderProducer.new(self, action: :create).run
  end

  def to_json
    to_hash.to_json
  end

  def to_hash
    hash = {}
    Order.attribute_names.each { |attr| hash[attr] = send(attr) }
    hash
  end
end

# o = Order.new id: 1, product: 'Macbook', amount: 6988.00, seller: 'Apple Store', buyer: 'Rivelino Junior'
# o = Order.new product: 'Macbook', amount: 6988.00