# About

Nesse laboratório foi feito uma simples POC (Prova de conceito) do uso do [Apache Kafka](https://kafka.apache.org/) com uma mini aplicação em ruby.
Para isso contei com a ajuda da gem [ruby-kafka](https://github.com/zendesk/ruby-kafka)

### Requisites
* O ambiente do Kafka rodando localhost na porta 9092
* Ruby 2.7.0+

### Instalation
```
bundle install
```

### Consumer
```
bundle console
load 'main.rb'
consumer = OrderConsumer.new(:create)
consumer.run
```

**Note:** caso precise parar de consumir os eventos faça isso -> `ctrl+c` e depois (opcional) `consumer.stop`

### Producer
```
bundle console
load 'main.rb'
30.times { Order.new(product: ['Macbook', 'Dell G3', 'Xiaomi Mi 10', 'Samsung Note 10'].sample, amount: rand(5000.00..6988.00).round(2)).create }
```

### Notes

* Se tiver monitorando o tópico *EC_NEW_ORDER* no kafka você verá no log o pedido serializado em JSON.
* Trata-se de algo bem simples, mas ajuda no entendimento de como produzir e consumir uma mensagem no Apache Kafka usando apenas o Ruby. Mas claro, isso pode ser usado no Rails ou em qualquer outro framework Ruby.
* Não deixe de ver o [Karafka](https://github.com/karafka/karafka), um framework que facilita ainda mais sua vida com o Apache Kafka.


### Thanks
Por Rivelino Junior
