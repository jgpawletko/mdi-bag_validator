Mdi::BagValidator
=================

## Overview

This is an experimental [BagIt](https://tools.ietf.org/html/draft-kunze-bagit-06) "worker" gem that:
* subscribes to a queue on a [RabbitMQ](https://www.rabbitmq.com/) message broker
* dequeues a message
* executes the validation operation
* publishes the results to a topic exchange


## Status
#### IN DEVELOPMENT
Currently walking through [https://github.com/jondot/sneakers/wiki/How-to:-running-a-stand-alone-worker](this) tutorial.


## Contributing

1. Fork it ( http://github.com/<my-github-username>/mdi-bag_validator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
