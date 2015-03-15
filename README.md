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
